# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=googledot-cursor-theme
pkgver=1.0.0
pkgrel=1
pkgdesc="Cursor theme inspired on Google"
arch=('any')
url="https://www.pling.com/p/1215613"
license=('GPL3')
depends=('libxcursor' 'libpng')
makedepends=('yarn' 'npm' 'python-clickgen')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ful1e5/Google_Cursor/archive/v$pkgver.tar.gz")
sha256sums=('c83c3037a8e8e0b473467b3ed8db5ee0328dcaded38290d660e035cd01a0288a')

build() {
	cd Google_Cursor-$pkgver
	yarn install --cache-folder $srcdir/yarn-cache
	yarn compile
}

package() {
	cd Google_Cursor-$pkgver
	install -d "$pkgdir/usr/share/icons"
	cp -r themes/GoogleDot "$pkgdir/usr/share/icons"
	chmod -R 755 "$pkgdir/usr/share/icons/GoogleDot"
}
