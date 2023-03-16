# Maintainer: éclairevoyant

_pkgname=tamzen-font
pkgbase="$_pkgname-git"
pkgname=({bdf,otb,pcf,psf,ttf}-$pkgbase)
pkgver=1.11.6.r1.3255e82
pkgrel=1
epoch=1
pkgdesc="Monospaced bitmap font for console and X11 (tamsyn-font fork)"
arch=(any)
url="https://github.com/sunaku/$_pkgname"
license=('custom')
makedepends=(git)
source=("git+$url.git")
b2sums=('SKIP')

pkgver() {
	cd $_pkgname
	git describe --long --tags | sed 's/^Tamzen-//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

package_bdf-tamzen-font-git() {
	pkgdesc+='(BDF font)'

	cd $_pkgname
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"

	install -Dm644 bdf/*.bdf -t "$pkgdir/usr/share/fonts/X11/misc/"
}

package_otb-tamzen-font-git() {
	pkgdesc+='(OTB font)'

	cd $_pkgname
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"

	install -Dm644 otb/*.otb -t "$pkgdir/usr/share/fonts/X11/misc/"
}

package_pcf-tamzen-font-git() {
	pkgdesc+='(PCF font)'

	cd $_pkgname
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"

	install -Dm644 pcf/*.pcf -t "$pkgdir/usr/share/fonts/X11/misc/"
}

package_psf-tamzen-font-git() {
	pkgdesc+='(PSF font)'

	cd $_pkgname
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"

	cd psf
	install -dm755 "$pkgdir/usr/share/kbd/consolefonts/"
	for i in *.psf; do
		gzip -c $i > "$pkgdir/usr/share/kbd/consolefonts/$i.gz"
	done
}

package_ttf-tamzen-font-git() {
	pkgdesc+='(TTF font)'

	cd $_pkgname
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"

	install -Dm644 ttf/*.ttf -t "$pkgdir/usr/share/fonts/TTF/"
}
