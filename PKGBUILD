# Maintainer: Lennard Hofmann <lennard dot hofmann at web dot de>
# Contributor: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: James Morris - jwm-art - james@jwm-art.net
pkgname=otf-bebas-neue-git
_pkgname=Bebas-Neue
pkgver=r182.686d14a
pkgrel=3
pkgdesc="Sans-serif display font for headline, caption, and titling"
arch=(any)
url="https://github.com/dharmatype/Bebas-Neue"
license=('OFL')
makedepends=(git)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$_pkgname::git+https://github.com/dharmatype/$_pkgname.git")
sha256sums=(SKIP)

pkgver() {
	cd "$srcdir/$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/$_pkgname"
	install -D -m644 -t "$pkgdir/usr/share/licenses/$pkgname" OFL.txt
	install -D -m644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
	install -D -m644 -t "$pkgdir/usr/share/fonts/OTF" \
		fonts/BebasNeue\(2018\)ByDhamraType/otf/*.otf
}
