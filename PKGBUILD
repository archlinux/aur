# Maintainer: Ward Segers <w@rdsegers.be>

pkgname=kali-themes
pkgver=2021.2.4
pkgrel=1
pkgdesc="GTK theme included with Kali Linux"
arch=('any')
url="https://gitlab.com/kalilinux/packages/kali-themes"
license=('GPL3')
optdepends=('')
options=('!strip' '!buildflags' '!makeflags')
makedepends=('optipng')
source=("https://gitlab.com/kalilinux/packages/kali-themes/-/archive/kali/2021.2.4/kali-themes-kali-2021.2.4.tar.gz")
sha512sums=('30640cdcb66ad608e1e7a91b7c87dd3220ad11029a88855be7e17b7298216d8bc30f29d1d451f9a5016a246d16b7732471737215b4f8e1930e7ca76ad7d56239')

build() {
	cd "$pkgname-kali-$pkgver"
	make 
}

package() {
	cd "$pkgname-kali-$pkgver"
	install -d -m755 "${pkgdir}/usr/share/"
	cp -r "share/themes" "$pkgdir/usr/share/themes"
}

