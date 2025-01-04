# Maintainer: gsh <gsh20040816@gmail.com>
pkgname=cider2-bin
pkgver=2.6.0
pkgrel=1
pkgdesc="A cross-platform Apple Music experience built on Vue.js and written from the ground up with performance in mind"
arch=('x86_64')
url="https://cider.sh/"
depends=(gtk3 nss libxss libxtst xdg-utils at-spi2-core libsecret)
optdepends=('libnotify: Playback notifications')
license=('unknown')
conflicts=('cider' 'cider-git')
sha256sums=('ff548ce574daee79a9be3a60117037124b62346e4acdc2e8fd52c3f346a04fa2')

# Download the DEB file (you can also provide a direct link)
source=("file://cider-linux-x64.deb")

package() {
  cd "$srcdir"
  bsdtar -xf "${srcdir}/data.tar.zst" -C "${pkgdir}/"
  install -d "$pkgdir/usr/bin/"
  ln -sf "/opt/Cider/cider" "${pkgdir}/usr/bin/cider"
}
