# Maintainer: hanker <91734413+hankertrix@users.noreply.github.com>
# Contributor: Perseo <perseo.gi98@gmail.com>
pkgname='xsct'
pkgver='2.3'
pkgrel=4
_gitname='sct'

pkgdesc='Improved sct (set screen color temperature)'
arch=('i686' 'x86_64')
url="https://github.com/faf0/$_gitname"
license=('Unlicense')
depends=('glibc' 'libx11' 'libxrandr')
provides=('xsct')
conflicts=('xsct')
source=("$pkgname-$pkgver.tar.gz::https://github.com/faf0/$_gitname/archive/$pkgver.tar.gz")
sha512sums=('8bedce06d53c00967b61d0254dc755a7b71f00a28800cecc3a34694a8b424374b843acc5eaebbc525c6771ce93dfd42585ae8723e70a73728d98de8b2dfc70f9')

build() {
	cd "$_gitname-$pkgver"
	make
}

package() {
	cd "$_gitname-$pkgver"
	install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 'README.md' "$pkgdir/usr/share/doc/$pkgname"
	install -Dm644 'xsct.1' "$pkgdir/usr/share/doc/$pkgname"
}
