# Maintainer: TheBitStick <the at bitstick dot rip>
pkgname=tsubasa-git
_pkgname=tsubasa
pkgver=r37.396d5f0
pkgrel=1
pkgdesc="Script for sharing screenshots and/or status updates using ihabunek/toot"
arch=('any')
url="https://github.com/thebitstick/tsubasa"
license=('GPL3')
depends=('fish' 'gnome-screenshot' 'zenity')
makedepends=('git')
provides=('tsubasa')
conflicts=('tsubasa')
source=('git+https://github.com/thebitstick/tsubasa')
sha512sums=('SKIP')

pkgver() {
	cd ${_pkgname}
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	install -D -t "$pkgdir/usr/bin" "${_pkgname}/tsubasa.fish"
	install -D -t "$pkgdir/usr/share/applications" "${_pkgname}/tsubasa.desktop"
	mv "$pkgdir/usr/bin/tsubasa.fish" "$pkgdir/usr/bin/tsubasa"
} 
