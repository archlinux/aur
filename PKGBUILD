# Maintainer: malacology
# Contributor: malacology

pkgname=dambe
pkgver=7.2.137
pkgrel=1
pkgdesc="New and improved tools for data analysis in molecular biology and evolution"
arch=('any')
url="http://dambe.bio.uottawa.ca/DAMBE/dambe.aspx"
license=('custom')
depends=(
	'wine'
	'wine_gecko'
	'wine-mono'
)
source=("https://github.com/starsareintherose/DAMBE/releases/download/${pkgver}/DAMBE.zip" "DAMBE.desktop" "DAMBE.png")
md5sums=('4ed716a3404e1ce59b22808239764d4a'
         '26dddd6b47d26046a4477118a89b5453'
         '93ff5f21c5e43ed5ba25f83fe0911e20')

package() {
  install -dm755 "$pkgdir"/usr/share/{DAMBE,applications}
  mv "$srcdir"/DAMBE/* "$pkgdir"/usr/share/DAMBE
  chmod -R 755 "$pkgdir"/usr/share/DAMBE
  install -Dm755 ${srcdir}/DAMBE.png ${pkgdir}/usr/share/DAMBE/DAMBE.png
  install -Dm755 ${srcdir}/DAMBE.desktop ${pkgdir}/usr/share/applications/DAMBE.desktop
}
