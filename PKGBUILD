# Maintainer: Ward Segers <w@rdsegers.be>

pkgname=kali-themes
pkgver=2023.1.0
pkgrel=1
pkgdesc="GTK theme included with Kali Linux"
arch=('any')
url="https://gitlab.com/kalilinux/packages/kali-themes"
license=('GPL3')
options=('!strip' '!buildflags' '!makeflags')
makedepends=('optipng' 'librsvg')
source=("https://gitlab.com/kalilinux/packages/$pkgname/-/archive/kali/$pkgver/$pkgname-kali-$pkgver.tar.gz")
sha512sums=('565f1c24f6a330a27b9c2aba046dd15509e5da943a7c8f1f982d345017494e919d32d84bd6ea23d1b45180913a6ee015116993284efe8a5b1ccaa3567f01d845')

build() {
	cd "$pkgname-kali-$pkgver"
	make
}

package() {
	cd "$pkgname-kali-$pkgver"
	install -d -m755 "${pkgdir}/usr/share/"
	cp -r "share/themes" "$pkgdir/usr/share/themes"
}

