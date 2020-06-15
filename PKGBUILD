# Maintainer: CareF <CareF.lm@gmail.com>

pkgname=deepin-dock-plugin-neoweather
pkgver=0.1
pkgrel=2
pkgdesc="A plugin for deepin dock, display weather information."
arch=('x86_64')
url="https://github.com/CareF/${pkgname}"
depends=('deepin-dock')
makedepends=('git' 'qt5-base' 'dtkcore')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
md5sums=('e70c2b203c65729a321e479b858ec587')

build() {
  qmake "$srcdir/$pkgname-$pkgver/source"
  make ${MAKEFLAGS}
}

package(){
  make INSTALL_ROOT="$pkgdir" install
}
