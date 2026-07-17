# Maintainer: Your Name <sahjoseph107 at example dot com>

pkgname=comic-cli
_pkgname=comic_cli
pkgver=0.1.0
pkgrel=1
pkgdesc='Command-line interface for the Comic dotfiles'
arch=('any')
url='https://github.com/jsah-mc/comic-cli'
license=('GPL-3.0-only')
depends=(
  'libsecret'
  'python'
  'python-materialyoucolor'
  'python-pillow'
  'python-requests'
)
optdepends=(
  'plasma-workspace: apply generated KDE color schemes'
  'quickshell-git: apply wallpapers through the Comic shell IPC'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/Release/comic_cli-$pkgver.tar.gz")
sha256sums=('fd01117601b316cdabd3c5d116dc4fa6bdce0b3e6fa49a50e8f4fd57a3c6bf17')

build() {
  cd "$_pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
