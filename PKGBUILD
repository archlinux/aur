# Maintainer: gsh <gsh20040816@gmail.com>
pkgname=cider2-bin
pkgver=2.2.0
pkgrel=1
pkgdesc="A cross-platform Apple Music experience built on Vue.js and written from the ground up with performance in mind"
arch=('x86_64')
url="https://cider.sh/"
depends=(gtk3 nss libxss libxtst xdg-utils at-spi2-core libsecret)
optdepends=('libnotify: Playback notifications')
license=('unknown')
conflicts=('cider')
sha256sums=('d52c3ecdb97a7109537a606af61bfd853552d8ef06c504603f168cf24814843b')

# Download the DEB file (you can also provide a direct link)
source=("file://cider_${pkgver}_amd64.deb")

package() {
  cd "$srcdir"
  bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
  install -d "$pkgdir/usr/bin/"
  ln -sf "/opt/Cider/cider" "${pkgdir}/usr/bin/cider"
}