pkgname="fortune-mod-sw"
pkgver=2.17
pkgrel=3
pkgdesc="Fortunes from Slackware Linux"
url="http://www.slackware.com/"
license=('unknown')
arch=('any')
depends=('fortune-mod')
install="${pkgname}.install"
source=("https://mirror.slackbuilds.org/slackware/slackware64-15.0/slackware64/y/bsd-games-${pkgver}-x86_64-${pkgrel}.txz")
sha256sums=('ea5a758a039a0d7a928ffb1da1dc7094c3d9f859e921cdeb11430566fe398682')
options=('!strip' '!docs' '!libtool')

build() {
	cd "${srcdir}/usr/share/games/fortunes"
	rm *.dat
	ls | xargs -I _ mv _ _-sw
	ls | xargs -n 1 strfile -r
}

package() {
	mkdir -p "${pkgdir}/usr/share"
	cp -r "${srcdir}/usr/share/games/fortunes" "${pkgdir}/usr/share/fortune"
}

