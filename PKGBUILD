# Maintainer: Johannes Maibaum <jmaibaum@gmail.com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=otf-libertinus
_pkgname="${pkgname#*-}"
pkgver=6.10
pkgrel=3
pkgdesc='The Libertinus font family, a fork of Linux Libertine and Biolinum with OpenType math'
arch=('any')
license=('OFL')
url="https://github.com/alif-type/$_pkgname"
source=("https://github.com/alif-type/$_pkgname/releases/download/v$pkgver/$_pkgname-$pkgver.zip")
sha256sums=('54cd1eedb95c67a4679a00ad2e2144c82395fc39cbcbf0ca88ea6dd1da4d5498')

package() {
	cd "${_pkgname^}-$pkgver"
	install -Dm644 -t "$pkgdir/usr/share/fonts/OTF/" ${_pkgname^}*.otf
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" OFL.txt AUTHORS.txt
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.txt FONTLOG.txt documentation/*
}
