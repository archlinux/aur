# Maintainer: Miro-sh
pkgname=animesama-cli
pkgver=1.0.11
pkgrel=1
pkgdesc="Browse and watch anime from anime-sama.fr in your terminal"
arch=('any')
url="https://github.com/Miro-sh/animesama-cli"
license=('GPL3')
depends=('python' 'python-requests' 'python-beautifulsoup4' 'python-textual' 'mpv')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Miro-sh/animesama-cli/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c9764dafe990943a2ccb964420dff1c59c80143461ef95492180bd142532de51')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
