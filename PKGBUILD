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
sha512sums=('28bcf83d06fcb7574e1317342ff273fc24870d3c94ea5ae2778a2970a34bcfaee25764eb6390ce4b4a486e0f54f6a4a8c2d51cf427b249d7befac2eccd770e76')

package() {
    local realdir=$(ls -d ${srcdir}/${pkgname}-${_sha_}*)
    install -d "${pkgdir}/usr/bin"
    install -m755 "${realdir}/xbacklight" "${pkgdir}/usr/bin/xbacklight"
}
