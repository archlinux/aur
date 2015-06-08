# Maintainer: Samuel Littley <aur@toastwaffle.com>
# Contributor: rnons <remotenonsense at gmail dot com>

pkgname=python-whoosh
pkgver=2.7.0
pkgrel=1
pkgdesc="Fast, pure-Python full text indexing, search, and spell checking library"
arch=('any')
url="http://bitbucket.org/mchaput/whoosh/wiki/Home"
license=("BSD")
depends=('python')
makedepends=('python-setuptools')
source=("http://pypi.python.org/packages/source/W/Whoosh/Whoosh-$pkgver.tar.gz" )
md5sums=('9a0fc2df9335e1d2e81dd84a2c4c416f')

build () {
  cd "${srcdir}/Whoosh-$pkgver"
  python setup.py build
}

package() {
  cd "${srcdir}/Whoosh-$pkgver"
  python setup.py install --root="${pkgdir}"

  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
