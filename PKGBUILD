# Maintainer: Ward Segers <w@rdsegers.be>

pkgname=kali-themes
pkgver=2021.4.2
pkgrel=1
pkgdesc="GTK theme included with Kali Linux"
arch=('any')
url="https://gitlab.com/kalilinux/packages/kali-themes"
license=('GPL3')
optdepends=('')
options=('!strip' '!buildflags' '!makeflags')
makedepends=('optipng' 'librsvg')
source=("https://gitlab.com/kalilinux/packages/$pkgname/-/archive/kali/$pkgver/$pkgname-kali-$pkgver.tar.gz")
sha512sums=('615549252436c02d64c608c5806a9a7dd5d5b12be6f1d976004102204ad85a800814dea0e36b1a62210ef4e66e3ae8647b73fbbb5cd9ea84879022505d6b633b')

build() {
	cd "$pkgname-kali-$pkgver"
	make
}

package() {
	cd "$pkgname-kali-$pkgver"
	install -d -m755 "${pkgdir}/usr/share/"
	cp -r "share/themes" "$pkgdir/usr/share/themes"
}

