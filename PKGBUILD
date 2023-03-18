# Maintainer: Shohei Maruyama <cheat.sc.linux@outlook.com>

pkgname=ttf-plemoljp
pkgver=1.5.0
pkgrel=1
pkgdesc='Plex Mono Language JP'
arch=('any')
url='https://github.com/yuru7/PlemolJP'
license=('custom:OFL')
provides=('ttf-font')
makedepends=('fontforge' 'python-fonttools' 'ttfautohint')
source=("git+https://github.com/yuru7/PlemolJP.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
	cd PlemolJP
	./make.sh
}

package() {
	cd PlemolJP
	find build -type f -name '*.ttf' -exec install -Dm644 {} -t "${pkgdir}/usr/share/fonts/PlemolJP" \;
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
