# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Alex Zose <alexander[dot]zosimidis[at]gmail[dot]com>

pkgname=crudini
pkgver=0.9.3
pkgrel=1
pkgdesc="A utility for manipulating ini files"
arch=('any')
url="https://www.pixelbeat.org/programs/crudini/"
license=('GPL2')
depends=('python-iniparse')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/pixelb/crudini/archive/${pkgver}.tar.gz")
sha512sums=('cd307fdb6b9ed6a505af956d919fb5f45dc93f55664e4bf6722a652a9fb0f413632edeeb54208fd9f6494dfbc53af9879619fb655e30461daac9eecbe2215a69')

build(){
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}
