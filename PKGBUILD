# Maintainer: AntiApple4life <antiapple at antiapple dot net>

pkgname=alcom-beta-bin
pkgver=1.1.0_rc.2
pkgrel=1
pkgdesc="A fast open-source alternative of VRChat Creator Companion"
arch=(x86_64)
url="https://github.com/vrc-get/vrc-get/tree/master/vrc-get-gui"
license=('MIT')
provides=("${pkgname%-beta-bin}")
conflicts=("${pkgname%-beta-bin}")
depends=(webkit2gtk-4.1 gtk3)
source=("https://github.com/vrc-get/vrc-get/releases/download/gui-v${pkgver//_/-}/alcom_${pkgver//_/-}_amd64.deb")
sha256sums=('edeb7768d78a0792b21b2a4a857c5dea4cf16811f706a0e7a0c36be6c5592b1d')

package() {
  cd "$srcdir"
  bsdtar -xf ${srcdir}/data.tar.gz -C ${pkgdir}/

  chown root:root -vR "${pkgdir}/"
  chmod 755 -vR "${pkgdir}/usr/bin"
}
