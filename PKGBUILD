# Maintainer: gsh <gsh20040816@gmail.com>
pkgname=cider2-bin
pkgver=2.4.1
pkgrel=1
pkgdesc="A cross-platform Apple Music experience built on Vue.js and written from the ground up with performance in mind"
arch=('x86_64')
url="https://cider.sh/"
depends=(gtk3 nss libxss libxtst xdg-utils at-spi2-core libsecret)
optdepends=('libnotify: Playback notifications')
license=('unknown')
conflicts=('cider' 'cider-git')
sha256sums=('d89d569c820ae581e38d7ea33c2ae7bcb6241ed1e13cd037839a7bd192604195')

# Download the DEB file (you can also provide a direct link)
source=("file://Cider-linux-debian-x64.deb")

package() {
  cd "$srcdir"
  bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
  install -d "$pkgdir/usr/bin/"
  ln -sf "/opt/Cider/cider" "${pkgdir}/usr/bin/cider"
}
