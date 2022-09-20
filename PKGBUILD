# Maintainer: Ward Segers <w@rdsegers.be>

pkgname=kali-themes
pkgver=2022.4.0
pkgrel=1
pkgdesc="GTK theme included with Kali Linux"
arch=('any')
url="https://gitlab.com/kalilinux/packages/kali-themes"
license=('GPL3')
options=('!strip' '!buildflags' '!makeflags')
makedepends=('optipng' 'librsvg')
source=("https://gitlab.com/kalilinux/packages/$pkgname/-/archive/kali/$pkgver/$pkgname-kali-$pkgver.tar.gz")
sha512sums=('b4274fa7fe05650b202db6169508d6ce0b042b410c18ce01ae08a3732889c4ec4f381bf17103e442733dd57d0c5e55320e6df8613ef6fab510ac23d3593ba277')

build() {
	cd "$pkgname-kali-$pkgver"
	make
}

package() {
	cd "$pkgname-kali-$pkgver"
	install -d -m755 "${pkgdir}/usr/share/"
	cp -r "share/themes" "$pkgdir/usr/share/themes"
}

