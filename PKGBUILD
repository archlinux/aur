# Maintainer: Asyrique Thevendran <asyrique+AUR@gmail.com>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: kaptoxic dragos240

pkgname=rescuetime
pkgver=2.10.0.1338
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
sha256sums_i686=('dec8079a7f0888ec92a0b3a26dfbe14c6213e9788de61ad1772f07066753ace8')
sha256sums_x86_64=('90b30405b98e8da7aa670acdcffa52e79ae212c1f833556646ab31455cd05708')

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