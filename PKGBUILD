# Maintainer: Asyrique Thevendran <asyrique+AUR@gmail.com>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: kaptoxic dragos240

pkgname=rescuetime
pkgver=2.9.11.1295
pkgrel=2
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
md5sums_i686=('DCA26B5A45F0C461C791C716B0CE6A07')
md5sums_x86_64=('0570FAA5FF802A42EC139FDEEC4681F2')

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
