# Maintainer: malacology
# Contributor: malacology

pkgname=tpsdig
pkgver=2.31
pkgrel=1
pkgdesc="Digitize landmarks & outlines from image files, scanner, or video"
arch=('any')
url="http://sbmorphometrics.org/soft-dataacq.html"
license=('custom')
makedepends=('innoextract')
depends=(
	'wine'
	'wine_gecko'
	'wine-mono'
)
source=("https://sbmorphometrics.org/morphmet/tpsdig2w64.exe" "tpsDig.desktop" "tpsDig.png")
md5sums=('4780a1ff616ffcdb5e60b6d581a48ae3'
         'c595d462fdea0417af99e481a8cb2edf'
         '2e2e7c55e63e7a3892e49aab613aed35')
build(){
  innoextract tpsdig2w64.exe
}
package() {
  install -dm755 "$pkgdir"/usr/share/{tpsdig,applications}
  mv "$srcdir"/app/* "$pkgdir"/usr/share/tpsdig
  install -Dm755 ${srcdir}/tpsDig.png ${pkgdir}/usr/share/tpsdig/tpsDig.png
  install -Dm755 ${srcdir}/tpsDig.desktop ${pkgdir}/usr/share/applications/tpsDig.desktop
}
