# Maintainer: malacology
# Contributor: malacology

pkgname=paup-gui
pkgver=4.0a169
pkgrel=1
pkgdesc="Phylogenetic Analysis Using PAUP"
arch=('any')
url="http://phylosolutions.com/paup-test/"
license=('custom')
depends=(
	'wine'
	'wine_gecko'
	'wine-mono'
)

source=("https://github.com/starsareintherose/paup/releases/download/${pkgver}/paup.zip" "paup-gui.desktop" "paup-gui.png")
md5sums=('f21078fec41433055d35e0a88614003d'
         '897dd144e4b643ab7966a11f408a3339'
         'ca6e885973f656d68410831033a00757')

package() {
  install -dm755 "$pkgdir"/usr/share/{paup-gui,applications}
  mv "$srcdir"/paup/* "$pkgdir"/usr/share/paup-gui
  install -Dm755 ${srcdir}/paup-gui.png ${pkgdir}/usr/share/paup-gui/paup-gui.png
  install -Dm755 ${srcdir}/paup-gui.desktop ${pkgdir}/usr/share/applications/paup-gui.desktop
}
