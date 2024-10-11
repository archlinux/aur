# Maintainer: AntiApple4life <antiapple at antiapple dot net>

pkgname=alcom-bin
pkgver=0.1.16_beta.1
_pkgver=0.1.16-beta.1
pkgrel=2
pkgdesc="A fast open-source alternative of VRChat Creator Companion"
arch=(x86_64)
url="https://github.com/vrc-get/vrc-get/tree/master/vrc-get-gui"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
depends=(webkit2gtk-4.1 gtk3)
source=("https://github.com/vrc-get/vrc-get/releases/download/gui-v${_pkgver}/alcom_${_pkgver}_amd64.deb"
	"alcom-url-handler.desktop")
sha256sums=('f73153372e0607f9db4b206bebf561457d4b511ebf1c89725bf99352ff733cb6'
	    'fd04fca52cba5afce59f0d9b7d1f4318af99b433b635ee95dac8dd8054f3d74d')

package() {
  cd "$srcdir"
  bsdtar -xf ${srcdir}/data.tar.gz -C ${pkgdir}/
  install -Dm644 -t "$pkgdir/usr/share/applications" alcom-url-handler.desktop

  chown root:root -vR "${pkgdir}/"
  chmod 755 -vR "${pkgdir}/usr/bin"
}
