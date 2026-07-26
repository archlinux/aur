# Maintainer: Miro-sh
pkgname=animesama-cli
pkgver=1.0.17
pkgrel=1
pkgdesc="Browse and watch anime from anime-sama.fr in your terminal"
arch=('any')
url="https://github.com/Miro-sh/animesama-cli"
license=('GPL3')
depends=('python' 'python-requests' 'python-beautifulsoup4' 'python-textual' 'mpv')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Miro-sh/animesama-cli/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b3f51bf0839bda84c852cc929b56519983b8a154907fc99b310d94196afaf826')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
