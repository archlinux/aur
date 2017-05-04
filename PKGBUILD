# Maintainer: boosterdev@linuxmail.org

pkgname=xdman
pkgver=6.2
pkgrel=1
pkgdesc="Xtreme Download Manager is a powerful tool to increase download speed up-to 500%, save videos from video sharing sites and integration with ANY browser."
arch=('x86_64')
url="http://xdman.sourceforge.net/"
depends=('java-runtime')
makedepends=('p7zip')
license=('GPL')
source=("xdm-setup-x64.tar.xz::https://sourceforge.net/projects/xdman/files/xdm-setup-x64.tar.xz/download"
        "xdman.desktop"
        "xdman"
        "xdman.png")
sha256sums=('28085c3a365e39258a57fd7ef8ee3b80dcdd3c97c0fdfc3bd150feece7aaf49d'
            'ee312ace7f1c7a5b70b69c3681097259dd6e5e2abe7f9d19d85861a2074120a6'
            'befc67049b2c2771c51e7c78b9518550c9a0be00f5f687440402927a22660b35'
            'b9e9ee05cc2b5d4ded7696a0b5bb6f99ba6a67839528482dc29b6e07e592e415')

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
