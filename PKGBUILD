# Maintainer: AntiApple4life <antiapple at antiapple dot net>

pkgname=alcom-bin
pkgver=1.1.5
pkgrel=1
pkgdesc="A fast open-source alternative of VRChat Creator Companion"
arch=(x86_64)
url="https://github.com/vrc-get/vrc-get/tree/master/vrc-get-gui"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
depends=(webkit2gtk-4.1 gtk3)
source=("https://github.com/vrc-get/vrc-get/releases/download/gui-v${pkgver}/alcom_${pkgver}_amd64.deb")
sha256sums=('74bfa60bb6c70eee2a3e94c2a487a9353e85d60653b57af0f9c47951580f20a3')

package() {
  cd "$srcdir"
  bsdtar -xf ${srcdir}/data.tar.gz -C ${pkgdir}/

  chown root:root -vR "${pkgdir}/"
  chmod 755 -vR "${pkgdir}/usr/bin"
}
