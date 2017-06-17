# Maintainer: Asyrique Thevendran <asyrique+AUR@gmail.com>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: kaptoxic dragos240

pkgname=rescuetime
pkgver=2.9.11.1300
pkgrel=1
pkgdesc="Application time-tracking for Linux. Stable version"
arch=('i686' 'x86_64')
url=https://www.rescuetime.com
license=('GPL2')
depends=('qt4' 'xorg-xprop' 'xprintidle')
conflicts=($pkgname-beta)
install=$pkgname.install
changelog=$pkgname.changelog
source_i686=("${pkgname}_${pkgver}_amd64.deb"::"$url/installers/${pkgname}_current_i386.deb")
source_x86_64=("${pkgname}_${pkgver}_amd64.deb"::"$url/installers/${pkgname}_current_amd64.deb")
sha256sums_i686=('cfc5ee42e8565f3ce5119f68dd6051d2d7645f1a44824cd737f82e4126c43261')
sha256sums_x86_64=('85d9b2d2109da56fbb430f18887885a03e0d9a67507562d048174d99dfca2a98')

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
