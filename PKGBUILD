# Maintainer: AntiApple4life <antiapple at antiapple dot net>

pkgname=alcom-bin
pkgver=1.1.8
pkgrel=1
pkgdesc="A fast open-source alternative of VRChat Creator Companion"
arch=(x86_64)
url="https://github.com/vrc-get/vrc-get/tree/master/vrc-get-gui"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
depends=(webkit2gtk-4.1 gtk3)
source=("https://github.com/vrc-get/vrc-get/releases/download/gui-v${pkgver}/alcom_${pkgver}-1_amd64.deb")
sha256sums=('11ec00c57ae9e83d920998152c37a34816b9d8f3fbc616455b5593b994047402')

package() {
  cd "$srcdir"
  bsdtar -xf ${srcdir}/data.tar.zst -C ${pkgdir}/

  chown root:root -vR "${pkgdir}/"
  chmod 755 -vR "${pkgdir}/usr/bin"
}
