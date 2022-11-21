# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Simon Sapin <simon dot sapin at exyr dot org>
# Contributor: Kyle Keen <keenerd@gmail.com>

pkgname=python38-cssselect2
pkgver=0.7.0
pkgrel=1
pkgdesc="CSS selectors for Python ElementTree"
url="https://pypi.org/project/cssselect2/"
license=('BSD')
arch=('any')
depends=('python38-tinycss2' 'python38-webencodings')
makedepends=('python38-build' 'python38-flit-core' 'python38-installer')
checkdepends=('python38-pytest-cov' 'python38-pytest-isort' 'python38-pytest-runner')
source=("https://pypi.io/packages/source/c/cssselect2/cssselect2-$pkgver.tar.gz")
sha512sums=('e3c975fe159d3bec53002bda31c72d9cb346f40529272d8d5bef6aa13142ce60f1e8aa20b039d93ff5ff3d2cd34119b8b2d406f889964eded69e770e4f04e949')

build() {
  cd cssselect2-$pkgver
  python3.8 -m build -nw
}

check() {
  cd cssselect2-$pkgver
  pytest
}

package() {
  cd cssselect2-$pkgver
  python3.8 -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
