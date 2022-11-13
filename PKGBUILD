# Maintainer: Ward Segers <w@rdsegers.be>

pkgname=kali-themes
pkgver=2022.4.3
pkgrel=1
pkgdesc="GTK theme included with Kali Linux"
arch=('any')
url="https://gitlab.com/kalilinux/packages/kali-themes"
license=('GPL3')
options=('!strip' '!buildflags' '!makeflags')
makedepends=('optipng' 'librsvg')
source=("https://gitlab.com/kalilinux/packages/$pkgname/-/archive/kali/$pkgver/$pkgname-kali-$pkgver.tar.gz")
sha512sums=('57b447a0224658c44d29ee3a99288eeb6a71750f764ec61a5c8c429192eb5d6a351e1fac38053d17206f5d98f3690ed3ec3b2f2598ff808b435e887115cb7a19')

build() {
	cd "$pkgname-kali-$pkgver"
	make
}

package() {
	cd "$pkgname-kali-$pkgver"
	install -d -m755 "${pkgdir}/usr/share/"
	cp -r "share/themes" "$pkgdir/usr/share/themes"
}

