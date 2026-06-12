# Maintainer: S-Sigdel <sakshyamsigdel1@gmail.com>
pkgname=vimhjkl
pkgver=0.5.0
pkgrel=1
pkgdesc="A terminal trainer that drills advanced Vim techniques in real vim/nvim and grades your keystrokes"
arch=('any')
url="https://github.com/S-Sigdel/vimhjkl"
license=('MIT')
depends=('python')
makedepends=('uv' 'python-installer')
optdepends=('neovim: preferred editor for drills'
            'vim: alternative editor for drills')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('49725dc3e0b59bb429558d4dbec820af4162cde19219a1ea6ee63d9827cbe146')

build() {
  cd "$pkgname-$pkgver"
  export UV_PYTHON_DOWNLOADS=never
  uv build --wheel --python python3
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
