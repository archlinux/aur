# Maintainer: Jameson Pugh <imntreal@gmail.com>
pkgname=python2-semantic
pkgver=1.0.3
pkgrel=1
pkgdesc="Common Natural Language Processing Tasks for Python"
url="http://packages.python.org/semantic"
arch=('any')
license=('BSD')
depends=('python2-quantities')
source=(http://pypi.python.org/packages/source/s/semantic/semantic-${pkgver}.tar.gz)
sha1sums=('de6f542e9e0c3e0d5f2afbfd430fff9fe0c3276c')

build() {
  cd ${srcdir}/semantic-$pkgver
  python2 setup.py build || return 1
}

package() {
  cd ${srcdir}/semantic-$pkgver
  python2 setup.py install --prefix=/usr --root=${pkgdir} || return 1
}
