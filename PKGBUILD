# Maintainer: Marko Korhonen <aur@marko.korhonen.cc>
# Based on the existing AUR package firefox-gnome-theme-git

pkgname=firefox-gnome-theme
pkgver=118
pkgrel=1
pkgdesc='A GNOME theme for Firefox'
arch=('any')
url="https://github.com/rafaelmardojai/$pkgname"
license=('Unlicense')
optdepends=('firefox: primary compatible browser' 'librewolf: alternative compatible browser')
conflicts=("$pkgname-git")
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::https://github.com/rafaelmardojai/$pkgname/archive/refs/tags/v${pkgver}.tar.gz" "INSTALL.md")
md5sums=('715e9486decba5605a225145d3a23e57'
         '25f18456221ffc91f472b1abff8aae84')

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -d "$pkgdir/usr/lib/$pkgname"
	cp -ra theme userChrome.css userContent.css configuration "$pkgdir/usr/lib/$pkgname"
	# Install docs & license
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 "$srcdir/INSTALL.md" "$pkgdir/usr/share/doc/$pkgname/INSTALL.md"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
