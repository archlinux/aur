# Maintainer: Asyrique Thevendran <asyrique+AUR@gmail.com>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: kaptoxic dragos240

pkgname=rescuetime
pkgver=2.9.11.1285
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
md5sums_i686=('3a64472143a251b810ed2593517d244c')
md5sums_x86_64=('4152339e027b72573e47cc53a1679056')

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
