# Maintainer: willemw <willemw12@gmail.com>

pkgname=bobrossquotes-git
pkgver=1.0
pkgrel=1
pkgdesc='Quotes from Bob Ross'
arch=(any)
url=https://github.com/kz6fittycent/BobRossQuotes
license=(MIT)
depends=(python)
makedepends=(git python-build python-installer python-setuptools python-wheel)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

build() {
  cd "$pkgname"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl

  mv "$pkgdir/usr/bin/bobross"{,quotes}
}
