# Maintainer: Ludvig Holtze <ludvig.holtze@protonmail.com>
# Contributor: David Thurstenson <thurstylark@gmail.com>

pkgname=ttf-dseg
epoch=1
pkgver=0.45
pkgrel=1
pkgdesc="Font family that imitates seven and fourteen segment displays"
arch=('any')
url="http://www.keshikan.net/fonts-e.html"
license=('OFL')
source=("https://github.com/keshikan/DSEG/releases/download/v${pkgver}/fonts-DSEG_v${pkgver//./}.zip")
sha256sums=('e2745d06e358474a25271fc58881f3f7806f3f39715fe4943348d04d207c1a6d')

package() {
	cd "${srcdir}/fonts-DSEG_v${pkgver//./}"
	find . -name '*.ttf' -execdir install -Dm644 {} -t "${pkgdir}/usr/share/fonts/TTF" \;
	install -Dm644 DSEG-LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
