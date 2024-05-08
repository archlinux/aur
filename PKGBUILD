# Maintainer: gsh <gsh20040816@gmail.com>
pkgname=cider2-bin
pkgver=2.4.0
pkgrel=1
pkgdesc="A cross-platform Apple Music experience built on Vue.js and written from the ground up with performance in mind"
arch=('x86_64')
url="https://cider.sh/"
depends=(gtk3 nss libxss libxtst xdg-utils at-spi2-core libsecret)
optdepends=('libnotify: Playback notifications')
license=('unknown')
conflicts=('cider' 'cider-git')
sha256sums=('f322036000090108d1026fa05db87ac6dd88a5098172fc3965b3ad905e586fb1')

# Download the DEB file (you can also provide a direct link)
source=("file://Cider-linux-debian-x64.deb")

package() {
  cd "$srcdir"
  bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
  install -d "$pkgdir/usr/bin/"
  ln -sf "/opt/Cider/cider" "${pkgdir}/usr/bin/cider"
}