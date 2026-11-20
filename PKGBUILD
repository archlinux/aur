# Maintainer: Theodore Huang <teddyhuangnan@gmail.com>

_basename=freetoken-desktop
pkgname=${_basename}-bin
pkgver=0.2.0_beta.27
_pkgver=${pkgver/_/-}
pkgrel=1
pkgdesc="FreeToken brings datacenter-scale model serving to your desktop. Run massive models locally, fast and efficiently."
arch=("x86_64")
url="https://github.com/FlashML-org/FreeToken"
license=("Apache-2.0")
depends=("webkit2gtk-4.1" "gtk3" "libayatana-appindicator")
optdepends=("freetoken: the 'ft' engine CLI this panel drives (pip/uv install)")
provides=("$_basename")
conflicts=("$_basename")
options=("!debug")
makedepends=("libarchive")

source=("${_basename}-${pkgver}.pkg.tar.zst::${url}-Web/releases/download/v${_pkgver}/freetoken-desktop-x86_64.pkg.tar.zst")

sha256sums=('164a05ae70354ccba446f169bba8ae0d732422e09a51fc1713593c436d3c18d7')

package() {
  bsdtar -xf ${_basename}-${pkgver}.pkg.tar.zst -C "$pkgdir"
  rm $pkgdir/.{PKGINFO,BUILDINFO,MTREE}
}
