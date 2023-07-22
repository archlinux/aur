# Maintainer: Shohei Maruyama <cheat.sc.linux@outlook.com>

pkgname=ttf-plemoljp
pkgver=1.6.0
pkgrel=2
pkgdesc='Plex Mono Language JP'
arch=('any')
url='https://github.com/yuru7/PlemolJP'
license=('custom:OFL')
provides=('ttf-font')
makedepends=('fontforge' 'python-fonttools' 'python-ttfautohint-py')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/yuru7/PlemolJP/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('36c9af69c0fde4108e888d5513b004236d45fea51b6d9f05a46efcb2acde2182')

build() {
	cd "PlemolJP-${pkgver}"
	./make.sh
}

package() {
	cd "PlemolJP-${pkgver}"
	find build -type f -name '*.ttf' -exec install -Dm644 {} -t "${pkgdir}/usr/share/fonts/PlemolJP" \;
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
