# Maintainer: gilcu3
_pkgname=changelog-chug
pkgname=python-$_pkgname
pkgver=0.0.3
pkgrel=1
pkgdesc='parser for project Change Log documents'
arch=('any')
url='https://git.sr.ht/~bignose/changelog-chug'
license=('Apache')
depends=('python' 'python-semver' 'python-docutils')
makedepends=('python-build' 'python-docutils' 'python-installer' 'python-wheel' 'python-setuptools')
checkdepends=('python-testscenarios' 'python-testtools' 'python-coverage')
source=(https://git.sr.ht/~bignose/changelog-chug/archive/release/$pkgver.tar.gz)
sha256sums=('0777bacb46df129120d813ab198419735acb43870cdc32dae181c57e37eafaa7')


build() {
  cd $_pkgname-release/$pkgver
  python -m build --wheel --no-isolation
}


package() {
  cd $_pkgname-release/$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.AGPL-3  "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE.AGPL-3
}
