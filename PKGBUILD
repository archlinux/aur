# Maintainer : Felix Yan <felixonmars@archlinux.org>

pkgname=python-repoze.profile
pkgver=2.3
pkgrel=4
pkgdesc="Aggregate profiling for WSGI requests"
arch=('any')
license=('BSD')
url="http://docs.repoze.org/profile/"
depends=('python')
optdepends=('pyprof2calltree')
makedepends=('python-setuptools' 'pyprof2calltree')
checkdepends=('python-nose')
source=("https://pypi.io/packages/source/r/repoze.profile/repoze.profile-$pkgver.tar.gz")
md5sums=('65e87b8ef5ac7e6b2074decdb89a180b')

build() {
  cd repoze.profile-$pkgver
  python setup.py build
}

check() {
  cd repoze.profile-$pkgver
  nosetests3
}

package() {
  cd repoze.profile-$pkgver
  python setup.py install --root="$pkgdir"

  install -Dm644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname
}
