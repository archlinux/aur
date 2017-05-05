# Maintainer: boosterdev@linuxmail.org

pkgname=xdman
pkgver=2016.6.2
pkgrel=1
pkgdesc="Xtreme Download Manager is a powerful tool to increase download speed up-to 500%, save videos from video sharing sites and integration with ANY browser."
arch=('i686' 'x86_64')
url="http://xdman.sourceforge.net/"
depends=('java-runtime')
makedepends=('p7zip')
license=('GPL')
source=("xdman.desktop" "xdman" "xdman.png")
source_i686=('http://sourceforge.net/projects/xdman/files/xdm-setup-x86.tar.xz')
source_x86_64=('http://sourceforge.net/projects/xdman/files/xdm-setup-x64.tar.xz')
sha256sums=('ee312ace7f1c7a5b70b69c3681097259dd6e5e2abe7f9d19d85861a2074120a6'
            'befc67049b2c2771c51e7c78b9518550c9a0be00f5f687440402927a22660b35'
            'b9e9ee05cc2b5d4ded7696a0b5bb6f99ba6a67839528482dc29b6e07e592e415')
sha256sums_i686=('e6d184c79249d259d1de95e73570c076e4f391788b4fea200fe6046c32d4962a')
sha256sums_x86_64=('28085c3a365e39258a57fd7ef8ee3b80dcdd3c97c0fdfc3bd150feece7aaf49d')

prepare () {
  cd xdm-setup
  7z x install.sh
}

package() {
  install -d -m755 "$pkgdir"/opt/xdman
  install -D -m644 "$srcdir"/xdman.desktop "$pkgdir"/usr/share/applications/xdman.desktop
  install -D -m775 "$srcdir"/xdman "$pkgdir"/opt/xdman
  install -D -m644 "$srcdir"/xdman.png "$pkgdir"/usr/share/pixmaps/xdman.png
  install -D -m644 "$srcdir"/xdm-setup/xdman.jar "$pkgdir"/opt/xdman/xdman.jar
}
