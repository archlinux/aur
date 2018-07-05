# Maintainer: Andrew Rabert <draje@nullsum.net>
# Contributor: Filippo Veneri <filippo[dot]veneri[at]gmail[dot]com>
# Contributor: Frederik “Freso” S. Olesen <freso.dk@gmail.com>

pkgname=acpilight
pkgver=1.1
pkgrel=1
pkgdesc="A backward-compatibile xbacklight replacement based on ACPI"
arch=('any')
url="https://gitlab.com/wavexx/acpilight"
license=('GPL3')
depends=('python')
provides=('xorg-xbacklight')
conflicts=('xorg-xbacklight')
install="${pkgname}".install
source=(https://gitlab.com/wavexx/acpilight/-/archive/v${pkgver}/acpilight-v${pkgver}.tar.bz2)
sha512sums=('9296e4969c8015752a6fc3b3356ff75ecd6ebe4c78d0fca6f8623e25864618d7c37eb4a99006d97b8d9519a7a72042d4c8a2e47875e351f29ce9e9fbd050155b')

_srcname="${pkgname}-v${pkgver}"

package() {
    cd "${_srcname}"

    install -Dm755 xbacklight ${pkgdir}/usr/bin/xbacklight
    install -Dm644 xbacklight.1 "${pkgdir}/usr/share/man/man1/xbacklight.1"
    install -Dm644 90-backlight.rules ${pkgdir}//usr/lib/udev/rules.d/90-backlight.rules
}
