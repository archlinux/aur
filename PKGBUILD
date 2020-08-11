# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=('palenight-gtk-theme' 'amarena-gtk-theme' 'gruvterial-gtk-theme')
pkgbase=material-gtk-framework
pkgver=0.1.9
pkgrel=1
pkgdesc="Material GTK themes built with the Material GTK Framework"
arch=('any')
url="https://github.com/JaxWilko/material-gtk-framework"
license=('GPL3')
depends=('gtk3' 'gtk-engine-murrine' 'gtk-engines')
makedepends=('sassc' 'inkscape' 'optipng')
options=('!strip')
source=("$pkgbase-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('c3033fa8d7bb7f490705b64c78854d66647375e161d6b2ac834de867f1846ce6')

build() {
	cd "$pkgbase-$pkgver"

	# Remove precompiled assets
	rm -rf dist

	./main.sh -vcf
	./main.sh -t amarena -vcf
	./main.sh -t gruvterial -vcf
}

package_palenight-gtk-theme() {
	cd "$pkgbase-$pkgver"
	install -d "$pkgdir/usr/share/themes"
	./main.sh -vid "$pkgdir/usr/share/themes"
}

package_amarena-gtk-theme() {
	cd "$pkgbase-$pkgver"
	install -d "$pkgdir/usr/share/themes"
	./main.sh -t amarena -vid "$pkgdir/usr/share/themes"
}

package_gruvterial-gtk-theme() {
	cd "$pkgbase-$pkgver"
	install -d "$pkgdir/usr/share/themes"
	./main.sh -t gruvterial -vid "$pkgdir/usr/share/themes"
}
