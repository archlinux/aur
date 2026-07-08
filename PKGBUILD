# Maintainer: AntiApple4life <antiapple at antiapple dot net>

pkgname=alcom-beta-bin
pkgver=1.1.7_rc.0
pkgrel=1
pkgdesc="A fast open-source alternative of VRChat Creator Companion"
arch=(x86_64)
url="https://github.com/vrc-get/vrc-get/tree/master/vrc-get-gui"
license=('MIT')
provides=("${pkgname%-beta-bin}")
conflicts=("${pkgname%-beta-bin}")
depends=(webkit2gtk-4.1 gtk3)
source=("https://github.com/vrc-get/vrc-get/releases/download/gui-v${pkgver//_/-}/alcom_${pkgver//_/.}-1_amd64.deb")
sha256sums=('b6c6584b0c592cc5411c0b833fec0b9cfa7e0c7ec8245e70f16cdae2f9120c1b')

package() {
  cd "$srcdir"
  bsdtar -xf ${srcdir}/data.tar.zst -C ${pkgdir}/

  chown root:root -vR "${pkgdir}/"
  chmod 755 -vR "${pkgdir}/usr/bin"
}
