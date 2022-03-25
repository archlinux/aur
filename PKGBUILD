# Maintainer: malacology
# Contributor: malacology

pkgname=tpsrelw
pkgver=1.74
pkgrel=1
pkgdesc="Relative warps analysis"
arch=('any')
url="http://sbmorphometrics.org/soft-tps.html"
license=('custom')
makedepends=('innoextract')
depends=(
	'wine'
	'wine_gecko'
	'wine-mono'
)
source=("https://sbmorphometrics.org/morphmet/tpsRelww64.exe" "tpsRelw.desktop" "tpsRelw.png")
md5sums=('b7c58e513c8e8409ccf59c82eaa40c2d'
         'd4f32527ad3479eabeb158c915fdb706'
         '48aa2b40a7d3e8490f0e89b2fb2a31d1')
build(){
  innoextract tpsRelww64.exe
}
package() {
  install -dm755 "$pkgdir"/usr/share/{tpsrelw,applications}
  mv "$srcdir"/app/* "$pkgdir"/usr/share/tpsrelw
  install -Dm755 ${srcdir}/tpsRelw.png ${pkgdir}/usr/share/tpsrelw/tpsRelw.png
  install -Dm755 ${srcdir}/tpsRelw.desktop ${pkgdir}/usr/share/applications/tpsRelw.desktop
}
