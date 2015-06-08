# Maintainer: Samuel Littley <aur@toastwaffle.com>
# Contributor: Steven Allen <steven@stebalien.com>
# Contributor: Piotr Husiatynski <phusiatynski@gmail.com>

pkgname=python2-whoosh
pkgver=2.7.0
pkgrel=1
pkgdesc="Fast, pure-Python full text indexing, search, and spell checking library"
license=("BSD")
url="http://bitbucket.org/mchaput/whoosh/wiki/Home"
depends=('python2')
makedepends=('python2-distribute' 'python2-nose')
source=("http://pypi.python.org/packages/source/W/Whoosh/Whoosh-$pkgver.tar.gz" )
arch=('any')
md5sums=('9a0fc2df9335e1d2e81dd84a2c4c416f')

check() {
  cd "${srcdir}/Whoosh-$pkgver"
  python2 setup.py test
}

package() {
  cd "${srcdir}/Whoosh-$pkgver"
  python2 setup.py install --root="${pkgdir}" --optimize=1

  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
