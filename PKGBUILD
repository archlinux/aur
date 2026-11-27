# Maintainer: Oliver Rümpelein <arch@pheerai.de>
pkgname=studiolink-plugin
pkgver=26.11.0
pkgrel=1
pkgdesc="VST/LV2/CLAP Plugin for studiolink, a SIP application to create high quality Audio over IP (AoIP) connections."
arch=('x86_64')
url="https://studio-link.de"
license=('MIT')
depends=('libgcc_s.so' 'libstdc++.so')
source=("https://download.studio.link/releases/v${pkgver}-stable/studio-link-plugin-linux.zip"
  "LICENSE")
sha512sums=('16f087310bb6ff68d58d520a3b7a10727ea09caf29e6d2d94a9fbf454f9838ab82c6cd0a58592abfc432c7631dc1ef3604a79c8a5261d70bb60add44185dd951'
  'ab7d307b2a6056c510db58fd18ed7e20cea74ec9508de3b04882e6dbc0490ff33c7960933774dd08e5bbed706e0df67fd5ce1c23fe02bac75c4e2d3d8b1a9fd2')

package() {
  mkdir -p ${pkgdir}/usr/lib/vst3/
  cp -R ${srcdir}/StudioLink.vst3 ${pkgdir}/usr/lib/vst3/StudioLink.vst3
  mkdir -p ${pkgdir}/usr/lib/lv2/
  cp -R ${srcdir}/studio-link.lv2 ${pkgdir}/usr/lib/lv2/studio-link.lv2
  install -Dm644 ${srcdir}/StudioLink.clap ${pkgdir}/usr/lib/clap/StudioLink.clap
  install -Dm644 ${srcdir}/LICENSE "${pkgdir}/usr/share/licenses/studiolink-plugin/LICENSE"
}
