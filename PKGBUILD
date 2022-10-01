# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=gptrace
pkgver=0.6.2
pkgrel=1
pkgdesc="Trace the activities of an external application"
url="http://www.muflone.com/gptrace/"
arch=('any')
license=('GPL')
makedepends=('python-setuptools')
depends=('gtk3' 'gobject-introspection' 'python-xdg' 'python-gobject' 'python-ptrace')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/muflone/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('910e4d5ee61e8339e1da3854339f3599103dadd2e2ffd4020df48907c0196eb2')

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --optimize=1 --root "${pkgdir}"
}
