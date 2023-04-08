# Maintainer : Felix Yan <felixonmars@archlinux.org>

pkgname=python-repoze.profile
pkgver=2.3
pkgrel=6
pkgdesc="Aggregate profiling for WSGI requests"
arch=('any')
license=('BSD')
url="http://docs.repoze.org/profile/"
depends=('python')
optdepends=('pyprof2calltree')
makedepends=('python-setuptools' 'pyprof2calltree')
checkdepends=('python-nose')
source=("https://pypi.io/packages/source/r/repoze.profile/repoze.profile-$pkgver.tar.gz")
sha256sums=('a13e01a40f8780d4c445758159be191bbd14f45040c49888fb2335fefffd5b8e')

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
