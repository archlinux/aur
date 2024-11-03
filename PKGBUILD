pkgname=tmux-rime
pkgver=0.0.2
pkgrel=1
pkgdesc="rime for tmux"
arch=(i686 x86_64 arm aarch64)
url=https://github.com/Freed-Wu/$pkgname
license=(GPL3)
source=("$url/archive/$pkgver.tar.gz")
depends=(librime glib2 tmux)
makedepends=(xmake git)
sha256sums=('b59f141d1c90d675cf921376012dbbf281a778bd131357c9fee9b279cdce478c')

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
