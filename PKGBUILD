# Maintainer: Marko Korhonen <aur@marko.korhonen.cc>
# Based on the existing AUR package firefox-gnome-theme-git

pkgname=firefox-gnome-theme
pkgver=113
pkgrel=1
pkgdesc='A GNOME theme for Firefox'
arch=('any')
url="https://github.com/rafaelmardojai/$pkgname"
license=('Unlicense')
optdepends=('firefox: primary compatible browser' 'librewolf: alternative compatible browser')
makedepends=('git')
conflicts=("$pkgname-git")
install="$pkgname.install"
source=("$pkgname.tar.gz::https://github.com/rafaelmardojai/$pkgname/archive/refs/tags/v${pkgver}.tar.gz" "INSTALL.md")
md5sums=('30641c43126404c387940a88dc766705'
         '07005689cf01618e0f8788e7b40c884d')

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -d "$pkgdir/usr/lib/$pkgname"
	cp -rfa * "$pkgdir/usr/lib/$pkgname"
	# Remove uneeded files
	rm -rf "$pkgdir/usr/lib/$pkgname"/{scripts,LICENSE,README.md,screenshot.png}
	# Install docs & license
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 "$srcdir/INSTALL.md" "$pkgdir/usr/share/doc/$pkgname/INSTALL.md"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
