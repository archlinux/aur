# Maintainer:	Wanesty <github.com/Wanesty/aurpkg>
# Dev: Andy 'Blocktronics' Herbert <blocktronics.org>

pkgname=moebius-bin
pkgver=1.0.29
pkgrel=2
pkgdesc="Modern ANSI & ASCII Art Editor"
arch=('x86_64')
url="https://github.com/blocktronics/moebius"
license=('Apache')
depends=('gtk3' 'libnotify' 'libxss' 'libxtst' 'xdg-utils' 'libappindicator-gtk3')
makedepends=('libarchive')
conflicts=('moebius')
source=("https://github.com/blocktronics/moebius/releases/download/$pkgver/Moebius.rpm") 
sha256sums=(69aaa1e42e287ed78c8e73971dae3df23ae4fa00e3416ea0fc262b7d147fefec)
noextract=("Moebius.rpm")

package() {
	bsdtar -C "${pkgdir}" -xf "$srcdir/Moebius.rpm"
	mkdir "$pkgdir/usr/bin"
	ln -s "/opt/Moebius/moebius" "$pkgdir/usr/bin/moebius"
}
