# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=ghidra-bin
pkgver=9.0.4
_date=20190516
pkgrel=2
pkgdesc='Software reverse engineering framework (bin)'
arch=(x86_64)
url=https://www.nsa.gov/ghidra
license=(Apache)
provides=(ghidra)
conflicts=(ghidra ghidra-git)
depends=('java-environment>=11' bash)
source=(https://ghidra-sre.org/ghidra_${pkgver}_PUBLIC_$_date.zip
        ghidra.desktop
        https://github.com/NationalSecurityAgency/ghidra/blob/Ghidra_${pkgver}_build/Ghidra/Framework/Generic/src/main/resources/images/GhidraIcon256.png
        https://github.com/NationalSecurityAgency/ghidra/blob/Ghidra_${pkgver}_build/LICENSE)
sha256sums=('a50d0cd475d9377332811eeae66e94bdc9e7d88e58477c527e9c6b78caec18bf'
            '15b6fa386be85b23c879331e93124953cd724765248895a7e305c68ca698867c'
            '93180199280b4a0492037db3de834d6a0b11742a25b7f2f3c3a06935ca0fe5a1'
            'f2105b982da9ddce5f2213d7e1d56ba238ba7830c99ac46fb877c780fb728906')
sha512sums=('be8c6ed3bfc8661489e9da191e643a7fbbe15b3adb82cd312f5c1abb08b761e8d8bef7cf7125fef0faa55e8660cd3ce405a580adce9adee5b52ea98eec625103'
            'a85b8b3276e2ff4ed8bda6470c15d02711ebaa48463c775cd2a36549fad738e9fe073dab80f8c57646490ffc959cdc27e9d25b1dc2a5810b0ddb249b5dc99a9b'
            'e4fb76653fce7b0c2f9e22c1bdc4df2b85031a52c089e0e8813fdfe66e9c57029150971c686237575473b8cf1cbe2befaf0d521d2387079ec5f7301b0f8098fb'
            '5fcc175414f0b323297c8c49e418a7863a637e61fe611c7e1694a187f1d7bf19e2c17d8fd20fc792027ec20429a9e6aa27302e7c001018b2ffed4ba15f96a8af')

package() {
  install -d "$pkgdir"/{opt,usr/bin}
  cp -a ghidra_$pkgver "$pkgdir"/opt/ghidra
  ln -s /opt/ghidra/ghidraRun "$pkgdir"/usr/bin/ghidra
  ln -s /opt/ghidra/support/analyzeHeadless "$pkgdir"/usr/bin/ghidra-analyzeHeadless

  install -Dm 644 ghidra.desktop -t "$pkgdir"/usr/share/applications
  install -Dm 644 GhidraIcon256.png "$pkgdir"/usr/share/pixmaps/ghidra.png

  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/ghidra
}
