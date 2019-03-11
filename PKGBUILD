# Maintainer: Manuel Domínguez López <mdomlop at gmail dot com>

_pkgver_year=2017
_pkgver_month=07
_pkgver_day=12

pkgname=fortunereader
pkgver=0.1
pkgrel=1
pkgdesc="A simple fortune interface written in python tk."
url="https://github.com/mdomlop/${pkgname}"
source=("$pkgname-$pkgver.tar.gz::https://github.com/mdomlop/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('5fbb5e8887e261003083b3c07e594e2e')
license=('GPL3')
depends=('python>=3', 'fortune-mod')
makedepends=('gettext')
optdepends=('fortune-mod-es: Fortune Cookies in Spanish')
arch=('any')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./configure
    make
    }

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make install DESTDIR=${pkgdir}
}
