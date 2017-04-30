# Maintainer: Asyrique Thevendran <asyrique+AUR@gmail.com>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: kaptoxic dragos240

pkgname=rescuetime
pkgver=2.9.11.1295
pkgrel=3
pkgdesc="Application time-tracking for Linux. Stable version"
arch=('i686' 'x86_64')
url=https://www.rescuetime.com
license=('GPL2')
depends=('qt4' 'xorg-xprop' 'xprintidle')
conflicts=($pkgname-beta)
install=$pkgname.install
changelog=$pkgname.changelog
source_i686=("$url/installers/${pkgname}_current_i386.deb")
source_x86_64=("$url/installers/${pkgname}_current_amd64.deb")
sha256sums_i686=('41063f2bd2bc86d170874474707339ac5f01b0e3317f56a633c7d825c0132e1a')
sha256sums_x86_64=('d02492c721d51a3cffb9205a233218e74ef4261124c7fb59b826f111bf580cc9')

pkgver() {
  grep Version control | cut --fields=2 -d' '
}

prepare() {
  bsdtar -xf control.tar.gz control
  bsdtar -xf data.tar.gz
}

package() {
  install -Dm644 {,"$pkgdir"/}usr/share/$pkgname/curl-ca-bundle.crt
  install -Dm755 {,"$pkgdir"/}usr/bin/$pkgname
}
