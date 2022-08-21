# Maintainer: Ward Segers <w@rdsegers.be>

pkgname=kali-themes
pkgver=2022.3.2
pkgrel=1
pkgdesc="GTK theme included with Kali Linux"
arch=('any')
url="https://gitlab.com/kalilinux/packages/kali-themes"
license=('GPL3')
options=('!strip' '!buildflags' '!makeflags')
makedepends=('optipng' 'librsvg')
source=("https://gitlab.com/kalilinux/packages/$pkgname/-/archive/kali/$pkgver/$pkgname-kali-$pkgver.tar.gz")
sha512sums=('787c78efff1809e6414a192d7c254dc52c1c25de591357e79d19f67ceba74a5dffa44ae6b8cd1ddcec6aae5949e327eb67f2a0682e1dd4b362f46820ab6b4f88')

build() {
	cd "$pkgname-kali-$pkgver"
	make
}

package() {
	cd "$pkgname-kali-$pkgver"
	install -d -m755 "${pkgdir}/usr/share/"
	cp -r "share/themes" "$pkgdir/usr/share/themes"
}

