# Maintainer: Johannes Maibaum <jmaibaum@gmail.com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=otf-libertinus
_pkgname="${pkgname#*-}"
pkgver=7.010
pkgrel=1
pkgdesc='The Libertinus font family, a fork of Linux Libertine and Biolinum with OpenType math'
arch=('any')
license=('OFL')
url="https://github.com/alerque/$_pkgname"
source=("$url/releases/download/v$pkgver/${_pkgname^}-$pkgver.tar.xz")
sha256sums=('d7b9cd1a1e56d11721db2093a09e96972420e03a5662394f81a793ee6998c746')

package() {
	cd "${_pkgname^}-$pkgver"
	install -Dm644 -t "$pkgdir/usr/share/fonts/OTF/" static/OTF/*.otf
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" OFL.txt AUTHORS.txt
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md FONTLOG.txt documentation/*
}
