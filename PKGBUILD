# Maintainer: malacology
# Contributor: malacology

pkgname=tpsutil
pkgver=2023.03.04
pkgrel=1
pkgdesc="tps file utility program"
arch=('any')
url="http://sbmorphometrics.org/soft-utility.html"
license=('custom')
makedepends=('innoextract')
depends=(
	'wine'
	'wine_gecko'
	'wine-mono'
)
source=("https://sbmorphometrics.org/morphmet/tpsutilw64.exe" "tpsUtil.desktop" "tpsUtil.png")
md5sums=('18da32fb82f3521f04b167bd3280bb32'
         '64baf6b610dcecc53a15342218579d18'
         '6e52ff5a9df8898532610845c973b23a')
build(){
  innoextract tpsutilw64.exe
}
package() {
  install -dm755 "$pkgdir"/usr/share/{tpsutil,applications}
  mv "$srcdir"/app/* "$pkgdir"/usr/share/tpsutil
  install -Dm755 ${srcdir}/tpsUtil.png ${pkgdir}/usr/share/tpsutil/tpsUtil.png
  install -Dm755 ${srcdir}/tpsUtil.desktop ${pkgdir}/usr/share/applications/tpsUtil.desktop
}
