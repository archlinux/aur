# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=('palenight-gtk-theme' 'amarena-gtk-theme')
pkgbase=material-gtk-framework
pkgver=0.1.7
pkgrel=1
pkgdesc="Material GTK themes built with the Material GTK Framework"
arch=('any')
url="https://github.com/JaxWilko/material-gtk-framework"
license=('GPL3')
depends=('gtk3' 'gtk-engine-murrine' 'gtk-engines')
makedepends=('sassc' 'inkscape' 'optipng')
optdepends=('vimix-icon-theme: suggested icon theme')
source=("$pkgbase-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('fb132bc3cc44443897470e5635349af78ad492dbaa5b9f2d6f10333cc4f5d30b')

build() {
	cd "$pkgbase-$pkgver"

	# Remove precompiled assets
	rm -rf dist

	./main.sh -vcf
	./main.sh amarena -vcf
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
