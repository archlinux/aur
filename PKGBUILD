# Maintainer: S-Sigdel <sakshyamsigdel1@gmail.com>
pkgname=vimhjkl
pkgver=0.2.0
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
sha256sums=('4fc539109894fd6d1b8c5b9616945389677d1154255071e377087b1d9dc4e45b')

build() {
  cd "$pkgname-$pkgver"
  export UV_PYTHON_DOWNLOADS=never
  uv build --wheel --python python3
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
