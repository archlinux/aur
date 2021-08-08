# Maintainer: Niklas <dev@n1klas.net>
# Contributor: Adam Goldsmith <adam@adamgoldsmith.name>
pkgbase=python-sarge
pkgname=('python-sarge' 'python2-sarge')
pkgver=0.1.6
pkgrel=1
_tag=81dc3347651b
pkgdesc="The sarge package provides a wrapper for subprocess which provides command pipeline functionality."
arch=('any')
url="https://bitbucket.org/vinay.sajip/sarge"
license=('GPL')
makedepends=('python' 'python2')
source=("https://bitbucket.org/vinay.sajip/sarge/get/${pkgver}.tar.gz")
sha512sums=('8cf77141f516297cfc029b6255618f497ab94453214e61ef280dd571019a40f461d81ab9bb793b08de2dae89832e50aaf687205814b22c305e03883b9dc3bfea')

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
