# Maintainer: Adrian Perez de Castro <aperez@igalia.com>

pkgname=(otf-sono ttf-sono ttf-sono-variable)
pkgbase=sono-font
pkgver=2.112
pkgrel=1
pkgdesc='Soft rounded monospace and proportional font by Ty Finck'
url=https://www.etceteratype.co/sono
license=(OFL-1.1)
arch=(any)
source=("$pkgbase-$pkgver.tar.gz::https://github.com/sursly/sono/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('f95bb7c11c017aaa4cc901cb5a856b28054787b48acec772eba0e7a3afe04c35c00bb8ba7f663d782f442b9f314d882f4697d9e18dd50244bcabb0d5a33fe468')

_package_common () {
	pkgdesc+=" $2"
	install -Dm644 -t "$pkgdir/usr/share/fonts/sono" \
		"${pkgbase%-font}-$pkgver/fonts/$1"/*
}

package_otf-sono () {
	_package_common otf '(14 static cuts)'
}

package_ttf-sono () {
	_package_common ttf '(14 static cuts)'
}

package_ttf-sono-variable () {
	_package_common variable '(14 static cuts)'
}
