# Maintainer: boosterdev@linuxmail.org

pkgname=xdman
pkgver=2018.7.2.7
pkgrel=1
pkgdesc="Xtreme Download Manager is a powerful tool to increase download speed up-to 500%, save videos from video sharing sites and integration with ANY browser."
arch=('i686' 'x86_64')
url="http://xdman.sourceforge.net/"
depends=('java-runtime')
makedepends=('p7zip')
license=('GPL')
source=('xdman.bin')
source_i686=('https://sourceforge.net/projects/xdman/files/xdm-2018-x86.tar.xz')
source_x86_64=('https://sourceforge.net/projects/xdman/files/xdm-2018-x64.tar.xz')
sha256sums=('befc67049b2c2771c51e7c78b9518550c9a0be00f5f687440402927a22660b35')
sha256sums_i686=('c882e06839b6771d2379a5e1d5d46df2d50d2f5ede9329d7d9d6cdce21ddb06d')
sha256sums_x86_64=('bd57e49f2fcc3591ff5b16938ff58a5d2ae0695472cc264a3628caf1f91f90bd')

prepare () {
  cd $srcdir
  7z x install.sh -oxdman
  rm -rf xdman/jre
}

package() {
  install -d -m755 "$pkgdir"/opt/xdman
  install -D -m644 "$srcdir"/xdman/xdman.desktop "$pkgdir"/usr/share/applications/xdman.desktop
  cp -dr --no-preserve='ownership' xdman "$pkgdir"/opt/
  install -D -m755 "$srcdir"/xdman.bin "$pkgdir"/opt/xdman/xdman
}
