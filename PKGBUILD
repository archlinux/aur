# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=cpucompare
pkgver=0.8.2
pkgrel=1
pkgdesc="A GTK+ application to make comparisons between CPU models."
url="http://www.muflone.com/cpucompare"
arch=('any')
license=('GPL3')
makedepends=('python-setuptools')
depends=('gtk3' 'python-gobject' 'python-xdg' 'gobject-introspection')
provides=('cpucompare')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/muflone/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('42da5f7fda40e855a3f6ce9deaf815c49a841d8760df8a72362fbbef44efcfb1')

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --optimize=1 --root "${pkgdir}"
}

