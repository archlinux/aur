# Maintainer: Manuel Domínguez López <mdomlop at gmail dot com>

_pkgver_year=2017
_pkgver_month=07
_pkgver_day=12

pkgname=wmdocker
pkgdesc="Docking System Tray."
pkgver=1.5.1
pkgrel=1
url="https://github.com/mdomlop/${pkgname}"

source=("https://github.com/mdomlop/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('6fa1e207fcd9f5257d835e8ed57bd53aaf4d5bde6a2fe58c56336da934612ca91d39f19e11b49cdfa2f5269d70bb76be7823f77db2522e884b035a8e53551c65')

license=('GPL2')
depends=('libx11')
arch=('x86_64' 'i686')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make  XLIBPATH=/usr/lib
    }

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make install PREFIX=${pkgdir}/usr
}
