# Maintainer: ashlyn <ashlyn at ashlyn dot gay>
# pkgbuild adapted from https://aur.archlinux.org/packages/ttf-sono (Adrian Perez de Castro <aperez@igalia.com>)

pkgname=( ttf-anybody ttf-anybody-variable)
pkgbase=ttf-anybody
pkgver=1.111
pkgrel=2
pkgdesc='Sans Serif font by Ty Finck'
url=https://www.etceteratype.co/anybody
license=(OFL-1.1)
arch=(any)
source=("Anybody-$pkgver.tar.gz::https://github.com/Etcetera-Type-Co/anybody/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('34356ba9c3a983dcd4740d298f7accf94febac75135f6fe3b253876f9b97f9debd291eade0444f3038a12897f46419d4b8d05ea188c1dc07c9dbd6a21b957931')

_package_common () {
	pkgdesc+=" $2"
	install -Dm644 -t "$pkgdir/usr/share/fonts/anybody" \
		$srcdir/"Anybody-$pkgver/fonts/$1"/*
	install -Dm644 $srcdir/Anybody-$pkgver/OFL.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}

package_ttf-anybody () {
	_package_common ttf
}

package_ttf-anybody-variable () {
	_package_common variable
}
