# Maintainer: Johannes Maibaum <jmaibaum@gmail.com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=otf-libertinus
_pkgname="${pkgname#*-}"
pkgver=6.11
pkgrel=1
pkgdesc='The Libertinus font family, a fork of Linux Libertine and Biolinum with OpenType math'
arch=('any')
license=('OFL')
url="https://github.com/alif-type/$_pkgname"
source=("$url/releases/download/v$pkgver/$_pkgname-$pkgver.zip")
sha256sums=('e15bc12f64aaed74dc1762cbeb9c9cecf3ee0a3265e4816f1c36feb926043266')

package() {
	cd "${_pkgname^}-$pkgver"
	install -Dm644 -t "$pkgdir/usr/share/fonts/OTF/" ${_pkgname^}*.otf
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" OFL.txt AUTHORS.txt
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.txt FONTLOG.txt documentation/*
}
