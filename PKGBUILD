# Maintainer: Ward Segers <w@rdsegers.be>

pkgname=kali-themes
pkgver=2022.1.1
pkgrel=1
pkgdesc="GTK theme included with Kali Linux"
arch=('any')
url="https://gitlab.com/kalilinux/packages/kali-themes"
license=('GPL3')
optdepends=('')
options=('!strip' '!buildflags' '!makeflags')
makedepends=('optipng' 'librsvg')
source=("https://gitlab.com/kalilinux/packages/$pkgname/-/archive/kali/$pkgver/$pkgname-kali-$pkgver.tar.gz")
sha512sums=('790321edf5e9f4309c3cd7ea0b8112ad91da080cb05a171e88a51a7e38cc9a05b46c19a54a593ac4ce21957afe1c35c5f46a744df86b6566d29d79b948c3bb4a')

build() {
	cd "$pkgname-kali-$pkgver"
	make
}

package() {
	cd "$pkgname-kali-$pkgver"
	install -d -m755 "${pkgdir}/usr/share/"
	cp -r "share/themes" "$pkgdir/usr/share/themes"
}

