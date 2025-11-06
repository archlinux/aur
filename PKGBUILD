# Maintainer: iamawacko <iamawacko@protonmail.com>
# Contributor: Sven-Hendrik Haase <svenstaro@gmail.com>

pkgname=doitlive
pkgver=5.2.0
pkgrel=1
pkgdesc='Because sometimes you need to do it live'
arch=(any)
url=https://github.com/sloria/doitlive
license=(MIT)
depends=(python python-click-didyoumean python-click-completion python-shellingham)
makedepends=(python-build python-installer python-wheel python-flit-core)
source=(https://github.com/sloria/doitlive/archive/$pkgver.tar.gz)
sha512sums=('0087d21903d80ae16aa7b4dd782e1bc18504b145778340334b5c4131cbf78c35c056655300df4bf929e5d81861a18a0d2bf27d02efaea8e27f96eca26b119085')

build() {
  cd $pkgname-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
