# Maintainer: Steven Seifried <gitlab@canox.net>
# Contributor: Steven Seifried <gitlab@canox.net>
pkgname=blisp-bin
_pkgname=blisp
pkgver=0.0.4
pkgrel=5
pkgdesc="ISP tool & library for Bouffalo Labs RISC-V Microcontrollers and SoCs"
url="https://github.com/pine64/blisp"
license=("MIT")
arch=('x86_64' 'armv7h' 'aarch64') 
conflicts=('blisp')
provides=('blisp')
source_x86_64=(https://github.com/pine64/blisp/releases/download/v${pkgver}/blisp-linux-x86_64-v${pkgver}.zip)
source_armv7h=(https://github.com/pine64/blisp/releases/download/v${pkgver}/blisp-linux-armv7-v${pkgver}.zip)
source_aarch64=(https://github.com/pine64/blisp/releases/download/v${pkgver}/blisp-linux-aarch64-v${pkgver}.zip)
sha256sums_x86_64=('d811b539b02cabbddf13b1fc79bb22e2284709d18cf02a7ca25faa73f7eb7c74')
sha256sums_armv7h=('9ece47805abc0647accf2ff64249eafea879afd7c00bb0bd0522759ce3368720')
sha256sums_aarch64=('24512372dba36c0539a73b82c5edf46421110fd8ba10fc8fa41b339afe3b7739')
sha512sums_x86_64=('66261bf5d3b411f0882d19ce70a13015a59b88f8af1aff0443a7e19cc9f7241e25fa6925165669d8c45670a2f9d8e133bf79b3087bb25697fa1b9edd3380b92d')
sha512sums_armv7h=('940f5896ae1bf65480d9e2f22babc2b996178d50fe28a10ee8aad41a23ccbf70edb273b986335fd95e256629f59d2721ffe5cfea0fb5d36392c63afba8b1a087')
sha512sums_aarch64=('bed0295f58b1e6caa2e53aa5618868f8efb63a03deccaa090c2b5c7e9d69c071426cd5da8091dc5d4fa14c96d9b38f71601870ff6a2c1f98bcc8f6bb6736b842')

prepare() {
  rm "${srcdir}"/*.zip
  mv "${srcdir}"/blisp* "${srcdir}"/blisp2
  mv "${srcdir}"/blisp2 "${srcdir}"/blisp
}

package() {
  install -Dm755 "${srcdir}"/blisp "${pkgdir}/"usr/bin/blisp
}
