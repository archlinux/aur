# Maintainer: iamawacko <iamawacko@protonmail.com>
# Contributor: Sven-Hendrik Haase <svenstaro@gmail.com>

pkgname=doitlive
pkgver=5.2.1
pkgrel=1
pkgdesc='Because sometimes you need to do it live'
arch=(any)
url=https://github.com/sloria/doitlive
license=(MIT)
depends=(python python-click-didyoumean python-click-completion python-shellingham)
makedepends=(python-build python-installer python-wheel python-flit-core)
source=(https://github.com/sloria/doitlive/archive/$pkgver.tar.gz)
sha512sums=('78053e27c87011407707b87c1521a99af3517d52652af2d3858cf811f4d973b442447086feb47e34db39fed3fb6aab5a0e43ec94167541d80d38485961a1e516')

build() {
  cd $pkgname-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
