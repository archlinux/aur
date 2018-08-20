# Maintainer: Niklas <dev@n1klas.net>
# Contributor: Adam Goldsmith <adam@adamgoldsmith.name>
pkgbase=python-sarge
pkgname=('python-sarge' 'python2-sarge')
pkgver=0.1.5
pkgrel=1
_tag=5380b6360f7d
pkgdesc="The sarge package provides a wrapper for subprocess which provides command pipeline functionality."
arch=('any')
url="https://bitbucket.org/vinay.sajip/sarge"
license=('GPL')
makedepends=('python' 'python2')
source=("https://bitbucket.org/vinay.sajip/sarge/get/${pkgver}.tar.gz")
sha512sums=('df67c150753a574780c3e30111a46508008a81191147e1b0778fd1bb76614cfda054fb807ee05a174d2aab0d0fad8f0b4c1c72d2a6a8e8b0e9e63d1dc232f2e5')

prepare() {
  cp -a vinay.sajip-sarge-${_tag}{,-python2}
}

package_python-sarge() {
  depends=('python')
  conflicts=('python-sarge-git')

  cd "${srcdir}/vinay.sajip-sarge-${_tag}"
  python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-sarge() {
  depends=('python2')
  conflicts=('python2-sarge-git')

  cd "${srcdir}/vinay.sajip-sarge-${_tag}-python2"
  python2 setup.py install --root="${pkgdir}" --optimize=1
}
