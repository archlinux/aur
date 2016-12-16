# Maintainer: Filippo Veneri <filippo[dot]veneri[at]gmail[dot]com>
# Contributor: Frederik “Freso” S. Olesen <freso.dk@gmail.com>

_sha_=7c01b2f
pkgname=acpilight
pkgver=r7.${_sha_}
pkgrel=2
pkgdesc="A backward-compatibile xbacklight replacement based on ACPI"
arch=('any')
url="https://github.com/wavexx/acpilight"
license=('GPL3')
depends=('python')
provides=('xorg-xbacklight')
conflicts=('xorg-xbacklight')
source=(${pkgname}-${pkgver}.zip::https://github.com/wavexx/acpilight/archive/${_sha_}.zip)
md5sums=('bbef18ba80379782ff230f41434d7350')

package() {
    local realdir=$(ls -d ${srcdir}/${pkgname}-${_sha_}*)
    install -d "${pkgdir}/usr/bin"
    install -m755 "${realdir}/xbacklight" "${pkgdir}/usr/bin/xbacklight"
}
