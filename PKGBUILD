# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=cpucompare
pkgver=0.8.0
pkgrel=2
pkgdesc="A GTK+ application to make comparisons between CPU models."
url="https://www.muflone.com/cpucompare"
arch=('any')
license=('GPL3')
depends=('gtk3' 'python-gobject' 'python-xdg' 'gobject-introspection')
provides=('cpucompare')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/muflone/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('11835df81d34b0a80480f0a0bd7cd6c3141a78b5ad7049f049cceaa4dd16d15e')

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --optimize=1 --root "${pkgdir}"
}

