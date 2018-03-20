# Maintainer: Andrew Rabert <draje@nullsum.net>
# Contributor: Filippo Veneri <filippo[dot]veneri[at]gmail[dot]com>
# Contributor: Frederik “Freso” S. Olesen <freso.dk@gmail.com>

pkgname=acpilight
pkgver=1.0.1
pkgrel=1
pkgdesc="A backward-compatibile xbacklight replacement based on ACPI"
arch=('any')
url="https://github.com/wavexx/acpilight"
license=('GPL3')
depends=('python')
provides=('xorg-xbacklight')
conflicts=('xorg-xbacklight')
install="${pkgname}".install
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/wavexx/acpilight/archive/v${pkgver}.tar.gz)
sha512sums=('c9b5805f919172d4806942ba1987d0c11fda420a807c45c404eda83cbcfc6011729b09d7ae3113106e006d2ed65ab26e4932869305e48d9493514b597c6e9713')

_srcname="${pkgname}-${pkgver}"

package() {
    cd "${_srcname}"

    install -Dm755 xbacklight ${pkgdir}/usr/bin/xbacklight
    install -Dm644 xbacklight.1 "${pkgdir}/usr/share/man/man1/xbacklight.1"

    install -Dm644 90-backlight.rules \
        ${pkgdir}/etc/udev/rules.d/90-backlight.rules
}
