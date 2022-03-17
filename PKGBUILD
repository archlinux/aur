# Maintainer: nemesys

pkgname=fbcondecor-systemd
pkgver=5.16.10
pkgrel=2
pkgdesc="Simple systemd service to activate console decorations on system start. Requires fbsplash and a kernel with fbcondecor patch applied."
arch=('any')
url="http://sourceforge.net/projects/fbsplash.berlios/"
license=('GPL')
depends=('fbsplash-systemd') 
optdepends=('linux-fbcondecor: enable console background images'
'linux-ck-fbcondecor: enable console background images and linux-ck kernel patchset')
conflicts=('fbsplash-scripts' 'initscripts-extras-fbsplash')
install=$pkgname.install
source=('fbcondecor.service')
md5sums=('45c16b37dcd15ae0c7333ac37ec899db')

package() {
  msg2 "Installing fbcondecor.service for systemd support.."
  # Install fbcodecor script and config file
  install -Dm644 "$srcdir/fbcondecor.service" "$pkgdir/usr/lib/systemd/system/fbcondecor.service"
}
