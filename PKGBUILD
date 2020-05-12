# Maintainer: Lorenzo Cappelletti <lorenzo.cappelletti gmail.com>

pkgname=('python-junit-xml' 'python2-junit-xml')
pkgver=1.9
pkgrel=1
pkgdesc="Creates JUnit XML test result documents that can be read by tools such as Jenkins."
arch=('any')
url="https://github.com/kyrus/python-junit-xml"
license=('MIT')
source=("python-junit-xml-${pkgver}.tar.gz::${url}/archive/v1.9.tar.gz")
sha256sums=('eaa679cafff29e8ac447b5e1e6351f3917d3802703fffcdba628ab1fb0b8bfbd')
makedepends=('python-setuptools' 'python2-setuptools')

prepare() {
  cp -a python-junit-xml-$pkgver python2-junit-xml-$pkgver
}

package_python-junit-xml() {
  depends=('python' 'python-six')

  cd "${srcdir}/python-junit-xml-${pkgver}"
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

package_python2-junit-xml() {
  depends=('python2' 'python2-six')

  cd "${srcdir}/python2-junit-xml-${pkgver}"
  python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
