# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=gnome-shell-extension-nasa-apod
pkgver=22
pkgrel=1
pkgdesc="Change your wallpaper daily to the NASA astronomy picture of the dauy"
arch=('any')
url="https://github.com/Elinvention/${pkgname}"
license=('GPL3')
depends=('gnome-shell>=40.0')
makedepends=('glib2' 'intltool')
source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/${pkgver}.tar.gz"
	"Makefile.patch"
)
md5sums=('fd112058c0a8b9462c50489f583d45f0'
         'fd0c8e90df92dbf3b65ea80d14afcb47')
sha1sums=('2bbc8aad30a15ea371c46a514697ded96354546a'
          '5548af7a915d0c28fc5271bd927614b5709fcc5c')
sha512sums=('cc72f4df9fe700b183eadb7ac3a68fcb2a1298a6dd8d136bcaf9568f357d13709c5bcfd3fc18d3c366d863c181c3aa33777d0c7a294cff37db97914c4e5cdda0'
            '19e8274af637bf10f91753ca2b78f684ad99e508a36792131414c4c62b9a9812451f4d2e226fc0d325929bcd462522ae473d5bd55873e2f698c376a4a144c6fd')

prepare() {
	cd "$pkgname-$pkgver"
	patch --strip=1 --input="$srcdir/Makefile.patch"
}

package() {
	cd "$pkgname-$pkgver"

	make INSTALL_PATH="$pkgdir/usr/share/gnome-shell/extensions" install
}
