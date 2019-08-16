# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=ghidra-bin
pkgver=9.0.4
_date=20190516
pkgrel=3
pkgdesc='Software reverse engineering framework (bin)'
arch=(x86_64)
url=https://www.nsa.gov/ghidra
license=(Apache)
provides=(ghidra)
conflicts=(ghidra ghidra-git)
depends=('java-environment>=11' bash)
source=(https://ghidra-sre.org/ghidra_${pkgver}_PUBLIC_$_date.zip
        ghidra.desktop
        https://raw.githubusercontent.com/NationalSecurityAgency/ghidra/Ghidra_${pkgver}_build/Ghidra/Framework/Generic/src/main/resources/images/GhidraIcon256.png
        https://raw.githubusercontent.com/NationalSecurityAgency/ghidra/Ghidra_${pkgver}_build/LICENSE)
sha256sums=('a50d0cd475d9377332811eeae66e94bdc9e7d88e58477c527e9c6b78caec18bf'
            '15b6fa386be85b23c879331e93124953cd724765248895a7e305c68ca698867c'
            '0e53f1b091046809c0f393326cadc69c27b1d574254e1094beedb312d09aa9c9'
            'c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha512sums=('be8c6ed3bfc8661489e9da191e643a7fbbe15b3adb82cd312f5c1abb08b761e8d8bef7cf7125fef0faa55e8660cd3ce405a580adce9adee5b52ea98eec625103'
            'a85b8b3276e2ff4ed8bda6470c15d02711ebaa48463c775cd2a36549fad738e9fe073dab80f8c57646490ffc959cdc27e9d25b1dc2a5810b0ddb249b5dc99a9b'
            'a942e9e22c20526cca59d289ef232984b21d25abc767b95803d39f1e90472290c395b61cdf186b0d6b54fc701e161552d2356aa651d16afbe7620b4b6118a2e9'
            'dc6b68d13b8cf959644b935f1192b02c71aa7a5cf653bd43b4480fa89eec8d4d3f16a2278ec8c3b40ab1fdb233b3173a78fd83590d6f739e0c9e8ff56c282557')

package() {
  install -d "$pkgdir"/{opt,usr/bin}
  cp -a ghidra_$pkgver "$pkgdir"/opt/ghidra
  ln -s /opt/ghidra/ghidraRun "$pkgdir"/usr/bin/ghidra
  ln -s /opt/ghidra/support/analyzeHeadless "$pkgdir"/usr/bin/ghidra-analyzeHeadless

  install -Dm 644 ghidra.desktop -t "$pkgdir"/usr/share/applications
  install -Dm 644 GhidraIcon256.png "$pkgdir"/usr/share/pixmaps/ghidra.png

  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/ghidra
}
