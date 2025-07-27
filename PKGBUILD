# Maintainer: AntiApple4life <antiapple at antiapple dot net>

pkgname=alcom-beta-bin
pkgver=1.1.3_beta.2
pkgrel=1
pkgdesc="A fast open-source alternative of VRChat Creator Companion"
arch=(x86_64)
url="https://github.com/vrc-get/vrc-get/tree/master/vrc-get-gui"
license=('MIT')
provides=("${pkgname%-beta-bin}")
conflicts=("${pkgname%-beta-bin}")
depends=(webkit2gtk-4.1 gtk3)
source=("https://github.com/vrc-get/vrc-get/releases/download/gui-v${pkgver//_/-}/alcom_${pkgver//_/-}_amd64.deb")
sha256sums=('2626e394a44bf2c9effbcf26e1df091139df19d007bfeefde0b90268a84a9bc9')

package() {
  cd "$srcdir"
  bsdtar -xf ${srcdir}/data.tar.gz -C ${pkgdir}/

  chown root:root -vR "${pkgdir}/"
  chmod 755 -vR "${pkgdir}/usr/bin"
}
