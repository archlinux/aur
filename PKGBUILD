# Maintainer: Filippo Veneri <filippo[dot]veneri[at]gmail[dot]com>
# Contributor: Frederik “Freso” S. Olesen <freso.dk@gmail.com>

_sha_=5fe6628
pkgname=acpilight
pkgver=r12.${_sha_}
pkgrel=1
pkgdesc="A backward-compatibile xbacklight replacement based on ACPI"
arch=('any')
url="https://github.com/wavexx/acpilight"
license=('GPL3')
depends=('python')
provides=('xorg-xbacklight')
conflicts=('xorg-xbacklight')
source=(${pkgname}-${pkgver}.zip::https://github.com/wavexx/acpilight/archive/${_sha_}.zip)
md5sums=('41eeeb7494176d4ffa4455c1a0deb934')

package() {
    local realdir=$(ls -d ${srcdir}/${pkgname}-${_sha_}*)
    install -d "${pkgdir}/usr/bin"
    install -m755 "${realdir}/xbacklight" "${pkgdir}/usr/bin/xbacklight"
}
