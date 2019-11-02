# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=ghidra-bin
pkgver=9.1
_date=20191023
pkgrel=1
pkgdesc='Software reverse engineering framework (bin)'
arch=(x86_64)
url=https://www.nsa.gov/ghidra
license=(Apache)
provides=(ghidra)
conflicts=(ghidra)
depends=('java-environment>=11' bash)
source=(https://ghidra-sre.org/ghidra_${pkgver}_PUBLIC_$_date.zip
        ghidra.desktop
        https://raw.githubusercontent.com/NationalSecurityAgency/ghidra/Ghidra_${pkgver}_build/Ghidra/Framework/Generic/src/main/resources/images/GhidraIcon256.png)
sha256sums=('29d130dfe85da6ec45dfbf68a344506a8fdcc7cfe7f64a3e7ffb210052d1875e'
            '15b6fa386be85b23c879331e93124953cd724765248895a7e305c68ca698867c'
            '0e53f1b091046809c0f393326cadc69c27b1d574254e1094beedb312d09aa9c9')

package() {
  install -d "$pkgdir"/{opt,usr/bin}
  cp -a ghidra_${pkgver}_PUBLIC "$pkgdir"/opt/ghidra
  ln -s /opt/ghidra/ghidraRun "$pkgdir"/usr/bin/ghidra
  ln -s /opt/ghidra/support/analyzeHeadless "$pkgdir"/usr/bin/ghidra-headless

  install -Dm 644 ghidra.desktop -t "$pkgdir"/usr/share/applications
  install -Dm 644 GhidraIcon256.png "$pkgdir"/usr/share/pixmaps/ghidra.png
}
