pkgname=rl_custom_rime
pkgver=0.0.1
pkgrel=1
pkgdesc="rime for readline"
arch=(i686 x86_64 arm aarch64)
url=https://github.com/Freed-Wu/$pkgname
license=(GPL3)
source=("$url/archive/$pkgver.tar.gz")
depends=(librime glib2 readline rl_custom_function)
makedepends=(xmake git)
sha256sums=('0e38134d2c13db47bd4f47398f8a7c619e1137c6032e6fed3ebfd6c3bbea6188')

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
