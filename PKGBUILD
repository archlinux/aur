# Maintainer: Mark Wagie < tomoghno at outlook dot com>
pkgname=remainduck
pkgver=1.6.1
pkgrel=1
pkgdesc="Remember your stuff in an adorably annoying way."
arch=('x86_64')
url="https://appcenter.elementary.io/com.github.matfantinel.reminduck/"
license=('GPL3')
depends=('granite' )
makedepends=('meson' 'vala')
provides=('com.github.matfantinel.reminduck')
conflicts=('com.github.matfantinel.reminduck')
source=("reminduck-$pkgver.tar.gz::https://github.com/matfantinel/reminduck/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4e481bfef1fb8988ee1757dd85d0a84b85ad9527dd53ee8de76f9891504f4af7')

build() {
	arch-meson reminduck-$pkgver build
	meson compile -C build
}

# No tests defined
#check() {
#	meson test -C build --print-errorlogs
#}

package() {
	DESTDIR="$pkgdir" meson install -C build
}

