# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=python-colorthief
pkgver=0.2.1
pkgrel=3
pkgdesc='Python module for grabbing the color palette from an image'
arch=(any)
url='https://github.com/fengsp/color-thief-py'
license=(BSD-3-Clause)
depends=(
  python
  python-pillow
)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
)
source=("git+https://github.com/fengsp/color-thief-py.git#tag=$pkgver")
b2sums=(b638181981bd425985d346b1a95f6d415f25dfff586b795a1bbb97208e81959d509d509d9258e85f452862e62c48bd945a6f29b8fbfdf7d6f01a329893d87407)

build() {
  cd color-thief-py
  python -m build --wheel --no-isolation
}

package() {
  cd color-thief-py
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
