# Maintainer: Miro-sh
pkgname=animesama-cli
pkgver=1.0.9
pkgrel=1
pkgdesc="Browse and watch anime from anime-sama.fr in your terminal"
arch=('any')
url="https://github.com/Miro-sh/animesama-cli"
license=('GPL3')
depends=('python' 'python-requests' 'python-beautifulsoup4' 'python-textual' 'mpv')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Miro-sh/animesama-cli/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9d46e7c2d70fbecedfa61bc436e36246641480adfee003c2cb3b41c1aa29cb8b')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
