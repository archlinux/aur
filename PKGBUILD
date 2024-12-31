# Maintainer: AntiApple4life <antiapple at antiapple dot net>

pkgname=alcom-beta-bin
pkgver=1.0.0_rc.2
pkgrel=1
pkgdesc="A fast open-source alternative of VRChat Creator Companion"
arch=(x86_64)
url="https://github.com/vrc-get/vrc-get/tree/master/vrc-get-gui"
license=('MIT')
provides=("${pkgname%-beta-bin}")
conflicts=("${pkgname%-beta-bin}")
depends=(webkit2gtk-4.1 gtk3)
source=("https://github.com/vrc-get/vrc-get/releases/download/gui-v${pkgver//_/-}/alcom_${pkgver//_/-}_amd64.deb"
	"alcom-url-handler.desktop")
sha256sums=('dfc15add5bce031457510d9616f1105a020920f131967beb22db7c582593e608'
	    'fd04fca52cba5afce59f0d9b7d1f4318af99b433b635ee95dac8dd8054f3d74d')

package() {
  cd "$srcdir"
  bsdtar -xf ${srcdir}/data.tar.gz -C ${pkgdir}/
  install -Dm644 -t "$pkgdir/usr/share/applications" alcom-url-handler.desktop

  chown root:root -vR "${pkgdir}/"
  chmod 755 -vR "${pkgdir}/usr/bin"
}
