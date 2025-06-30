# Maintainer: AntiApple4life <antiapple at antiapple dot net>

pkgname=alcom-bin
pkgver=1.1.1
pkgrel=1
pkgdesc="A fast open-source alternative of VRChat Creator Companion"
arch=(x86_64)
url="https://github.com/vrc-get/vrc-get/tree/master/vrc-get-gui"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
depends=(webkit2gtk-4.1 gtk3)
source=("https://github.com/vrc-get/vrc-get/releases/download/gui-v${pkgver}/alcom_${pkgver}_amd64.deb")
sha256sums=('9a4c5c1ce3cc406308c56a1098cf0bb30fbd97fb5188a1ad07ab16df40dcadd6')

package() {
  cd "$srcdir"
  bsdtar -xf ${srcdir}/data.tar.gz -C ${pkgdir}/

  chown root:root -vR "${pkgdir}/"
  chmod 755 -vR "${pkgdir}/usr/bin"
}
