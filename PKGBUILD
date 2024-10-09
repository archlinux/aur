pkgname=tmux-rime
pkgver=0.0.1
pkgrel=1
pkgdesc="rime for tmux"
arch=(i686 x86_64 arm aarch64)
url=https://github.com/Freed-Wu/$pkgname
license=(GPL3)
source=("$url/archive/$pkgver.tar.gz")
depends=(librime glib2 tmux)
makedepends=(xmake git)
sha256sums=('23fa2adf9df745d32edf00cec609af1333bbd41016725240c708d41bdfc9e8c5')

export XMAKE_ROOT=y

build() {
	cd "$pkgname-$pkgver" || return 1

	xmake
}

package() {
	cd "$pkgname-$pkgver" || return 1

	xmake install -o"$pkgdir/usr"
}
# ex: nowrap
