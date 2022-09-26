# Maintainer: Ward Segers <w@rdsegers.be>

pkgname=kali-themes
pkgver=2022.4.2
pkgrel=1
pkgdesc="GTK theme included with Kali Linux"
arch=('any')
url="https://gitlab.com/kalilinux/packages/kali-themes"
license=('GPL3')
options=('!strip' '!buildflags' '!makeflags')
makedepends=('optipng' 'librsvg')
source=("https://gitlab.com/kalilinux/packages/$pkgname/-/archive/kali/$pkgver/$pkgname-kali-$pkgver.tar.gz")
sha512sums=('4446ed268cf0acd3723a391d46af79d504d6a4c71c614419e60443cbb0300c80d2a3f9fe9a28e50ac8368e452a3cd1b296cd0a611235fbf17dda67ff56a3e759')

build() {
	cd "$pkgname-kali-$pkgver"
	make
}

package() {
	cd "$pkgname-kali-$pkgver"
	install -d -m755 "${pkgdir}/usr/share/"
	cp -r "share/themes" "$pkgdir/usr/share/themes"
}

