# Maintainer: Francisco Giordano <frangio.1@gmail.com>
pkgname=cog-vm
pkgver=5.1.201608171728
pkgrel=1
pkgdesc="Cross-platform virtual machine for Squeak, Pharo, Cuis, and Newspeak."
arch=('x86_64')
url="http://opensmalltalk.org"
license=('MIT')
depends=()
provides=('squeak-vm')
conflicts=('squeak-vm')
source=("https://github.com/OpenSmalltalk/opensmalltalk-vm/archive/201608171728.tar.gz")
md5sums=('f6d5c990262c69a8e59ee7842a32786a')

build() {
  cd "$srcdir/opensmalltalk-vm-201608171728/build.linux64x64/squeak.cog.spur/build.itimerheartbeat"
  echo y | ./mvm
}

package() {
  cd "$srcdir/opensmalltalk-vm-201608171728/products/cogspur64linux"
  mkdir "$pkgdir/usr"
  cp -r "bin" "lib" "$pkgdir/usr"
}
