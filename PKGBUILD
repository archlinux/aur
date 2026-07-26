# Maintainer: Miro-sh
pkgname=animesama-cli
pkgver=1.0.16
pkgrel=1
pkgdesc="Browse and watch anime from anime-sama.fr in your terminal"
arch=('any')
url="https://github.com/Miro-sh/animesama-cli"
license=('GPL3')
depends=('python' 'python-requests' 'python-beautifulsoup4' 'python-textual' 'mpv')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Miro-sh/animesama-cli/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9d5fc458f5d1397adc1e4a7e3ebc31a7effad7e461a3bdfa96493db47274d790')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
