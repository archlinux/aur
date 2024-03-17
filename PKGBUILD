# Maintainer: gsh <gsh20040816@gmail.com>
pkgname=cider2-bin
pkgver=2.3.2
pkgrel=2
pkgdesc="A cross-platform Apple Music experience built on Vue.js and written from the ground up with performance in mind"
arch=('x86_64')
url="https://cider.sh/"
depends=(gtk3 nss libxss libxtst xdg-utils at-spi2-core libsecret)
optdepends=('libnotify: Playback notifications')
license=('unknown')
conflicts=('cider' 'cider-git')
sha256sums=('3cc6fad8da144af3b8515cb213bd4d300a3b9199b1c45601c22dee7415a4d040')

# Download the DEB file (you can also provide a direct link)
source=("file://cider_${pkgver}_amd64.deb")

package() {
  cd "$srcdir"
  bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
  install -d "$pkgdir/usr/bin/"
  ln -sf "/opt/Cider/cider" "${pkgdir}/usr/bin/cider"
}