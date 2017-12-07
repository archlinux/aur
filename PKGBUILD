# Maintainer: Asyrique Thevendran <asyrique+AUR@gmail.com>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: kaptoxic dragos240

pkgname=rescuetime
pkgver=2.10.0.1322
pkgrel=1
pkgdesc="Application time-tracking for Linux. Stable version"
arch=('i686' 'x86_64')
url=https://www.rescuetime.com
license=('GPL2')
depends=('qt4' 'xorg-xprop' 'xprintidle')
conflicts=($pkgname-beta)
install=$pkgname.install
source_i686=("${pkgname}_${pkgver}_i686.deb"::"$url/installers/${pkgname}_current_i386.deb")
source_x86_64=("${pkgname}_${pkgver}_amd64.deb"::"$url/installers/${pkgname}_current_amd64.deb")
sha256sums_i686=('df67ba8238a46314b5b9e069a8b1768adb2f01a29bb406049274cbac3197011b')
sha256sums_x86_64=('4bdd2b0470c9b8e33ddf911193fb245fbfd42b0cb669de5a5c853cf4e88ba62c')

pkgver() {
grep Version control | cut --fields=2 -d' '
}

prepare() {
bsdtar -xf control.tar.gz control
bsdtar -xf data.tar.xz
}

package() {
install -Dm644 {,"$pkgdir"/}usr/share/$pkgname/curl-ca-bundle.crt
install -Dm755 {,"$pkgdir"/}usr/bin/$pkgname
}