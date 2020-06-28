# Maintainer: Johannes Maibaum <jmaibaum@gmail.com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=otf-libertinus
_pkgname="${pkgname#*-}"
pkgver=6.12
pkgrel=1
pkgdesc='The Libertinus font family, a fork of Linux Libertine and Biolinum with OpenType math'
arch=('any')
license=('OFL')
url="https://github.com/alif-type/$_pkgname"
source=("$url/releases/download/v$pkgver/$_pkgname-$pkgver.zip")
sha256sums=('62cd83cb2198d946d1a66f590c4bcd3321a0a82c63aa2efb6951ca784bd3ec1a')

package() {
	cd "${_pkgname^}-$pkgver"
	install -Dm644 -t "$pkgdir/usr/share/fonts/OTF/" ${_pkgname^}*.otf
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" OFL.txt AUTHORS.txt
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md FONTLOG.txt documentation/*
}
