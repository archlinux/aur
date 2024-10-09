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
sha256sums=('6e91d22e29d1968a03b7ce3ed0d291e562ebea6a2599c4679491ba41b68c56aa')

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
