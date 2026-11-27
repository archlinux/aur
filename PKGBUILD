# Maintainer: Oliver Rümpelein <arch@pheerai.de>
pkgname=studiolink-onair-plugin
pkgver=26.11.0
pkgrel=1
pkgdesc="LV2 Plugin for studiolink's on-air service"
arch=('x86_64')
url="https://studio-link.de"
license=('MIT')
depends=('libgcc_s.so' 'libstdc++.so')
source=("https://download.studio.link/releases/v${pkgver}-stable/studio-link-plugin-onair-linux.zip"
  "LICENSE")
sha512sums=('271acf1827af36fc13e4a6dba12738930f697673aa3fb198601ddb637cd4a02aa85d2d02e8e7fafe496006628a17766a91486aaf916dfa6a803f00b37a3aceb7'
            '84e946ad3264e4dbbf0949a048b97be2ef5bced6638693902b128bc50e74c366dd39d46626c1432721b2ca399590bc13d6b9406cc115d1c4f8997d688bb88231')

package() {
  mkdir -p ${pkgdir}/usr/lib/lv2/
  cp -R ${srcdir}/studio-link-onair.lv2 ${pkgdir}/usr/lib/lv2/studio-link-onair.lv2

  mkdir -p ${pkgdir}/usr/lib/vst3/
  cp -R ${srcdir}/StudioLinkOnAir.vst3 ${pkgdir}/usr/lib/vst3/StudioLinkOnAir.vst3

  install -Dm755 ${srcdir}/StudioLinkOnAir.clap ${pkgdir}/usr/lib/clap/StudioLinkOnAir.clap

  install -Dm644 ${srcdir}/LICENSE "${pkgdir}/usr/share/licenses/studiolink-onair-plugin/LICENSE"
}
