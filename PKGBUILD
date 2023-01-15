# Maintainer: Ward Segers <w@rdsegers.be>

pkgname=kali-themes
pkgver=2023.1.1
pkgrel=1
pkgdesc="GTK theme included with Kali Linux"
arch=('any')
url="https://gitlab.com/kalilinux/packages/kali-themes"
license=('GPL3')
options=('!strip' '!buildflags' '!makeflags')
makedepends=('optipng' 'librsvg')
source=("https://gitlab.com/kalilinux/packages/$pkgname/-/archive/kali/$pkgver/$pkgname-kali-$pkgver.tar.gz")
sha512sums=('b8711b1b1726dbbbca3975446d394998186f68ee58eaeee409903902f57aa26044ef247193a92908c6bbb00b03949d276bb2ff073e974d2a1977762a6a18b680')

build() {
	cd "$pkgname-kali-$pkgver"
	make
}

package() {
	cd "$pkgname-kali-$pkgver"
	install -d -m755 "${pkgdir}/usr/share/"
	cp -r "share/themes" "$pkgdir/usr/share/themes"
}

