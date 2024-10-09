# Maintainer: AntiApple4life <antiapple at antiapple dot net>

pkgname=alcom-bin
pkgver=0.1.16_beta.1
_pkgver=0.1.16-beta.1
pkgrel=1
pkgdesc="A fast open-source alternative of VRChat Creator Companion"
arch=(x86_64)
url="https://github.com/vrc-get/vrc-get/tree/master/vrc-get-gui"
license=('MIT')
depends=(webkit2gtk-4.1 gtk3)
source=("https://github.com/vrc-get/vrc-get/releases/download/gui-v${_pkgver}/alcom_${_pkgver}_amd64.deb")
sha256sums=('f73153372e0607f9db4b206bebf561457d4b511ebf1c89725bf99352ff733cb6')

package() {
  cd "$srcdir"
  bsdtar -xf ${srcdir}/data.tar.gz -C ${pkgdir}/

  chown root:root -vR "${pkgdir}/"
  chmod 755 -vR "${pkgdir}/usr/bin"
}
