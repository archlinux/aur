# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=ghidra-bin
pkgver=9.0.2
_date=20190403
pkgrel=1
pkgdesc='Software reverse engineering framework (bin)'
arch=(i686 x86_64)
url=https://ghidra-sre.org
license=(Apache)
conflicts=(ghidra ghidra-git)
depends=('java-environment>=11')
source=(https://ghidra-sre.org/ghidra_${pkgver}_PUBLIC_$_date.zip)
sha256sums=('10ffd65c266e9f5b631c8ed96786c41ef30e2de939c3c42770573bb3548f8e9f')
sha512sums=('865eb93029ca56936e444c76d442d14f71d7c3f59c2a19c67175759c918b8500e175e62ec7338e22e364b2a2ee42827f886c70a487f44b18dddeda60bf6a7ac7')
            
package() {
  cd ghidra_$pkgver
  install -d "$pkgdir"/{opt/ghidra,usr/bin}
  cp -a * "$pkgdir"/opt/ghidra
  ln -s /opt/ghidra/ghidraRun "$pkgdir"/usr/bin/ghidra
}
