pkgname=tmux-rime
pkgver=0.0.3
pkgrel=1
pkgdesc="rime for tmux"
arch=(i686 x86_64 arm aarch64)
url=https://github.com/Freed-Wu/$pkgname
license=(GPL3)
source=("$url/archive/$pkgver.tar.gz")
depends=(librime glib2 tmux)
makedepends=(xmake git)
sha256sums=('012d1b8e8fe265fbd927af113fa7d54fc8704a449f9b86904767fe20378bea81')

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
