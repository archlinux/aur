# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=ghidra-beta-bin
pkgver=9.1
_date=20190923
pkgrel=1
pkgdesc='Software reverse engineering framework (beta, bin)'
arch=(x86_64)
url=https://www.nsa.gov/ghidra
license=(Apache)
provides=(ghidra)
conflicts=(ghidra)
depends=('java-environment>=11' bash)
source=(https://ghidra-sre.org/ghidra_${pkgver}-BETA_DEV_$_date.zip
        https://raw.githubusercontent.com/NationalSecurityAgency/ghidra/master/LICENSE
        ghidra.desktop
        https://raw.githubusercontent.com/NationalSecurityAgency/ghidra/master/Ghidra/Framework/Generic/src/main/resources/images/GhidraIcon256.png)
sha256sums=('3d61de711b7ea18bdee3ed94c31429e4946603b3e7d082cca5e949bbd651f051'
            'c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4'
            '15b6fa386be85b23c879331e93124953cd724765248895a7e305c68ca698867c'
            '0e53f1b091046809c0f393326cadc69c27b1d574254e1094beedb312d09aa9c9')

package() {
  install -d "$pkgdir"/{opt,usr/bin}
  cp -a ghidra_$pkgver-BETA_DEV "$pkgdir"/opt/ghidra
  ln -s /opt/ghidra/ghidraRun "$pkgdir"/usr/bin/ghidra
  ln -s /opt/ghidra/support/analyzeHeadless "$pkgdir"/usr/bin/ghidra-headless

  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/ghidra

  install -Dm 644 ghidra.desktop -t "$pkgdir"/usr/share/applications
  install -Dm 644 GhidraIcon256.png "$pkgdir"/usr/share/pixmaps/ghidra.png
}
