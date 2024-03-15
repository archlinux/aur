# Maintainer: gsh <gsh20040816@gmail.com>
pkgname=cider2-bin
pkgver=2.3.2
pkgrel=1
pkgdesc="A cross-platform Apple Music experience built on Vue.js and written from the ground up with performance in mind"
arch=('x86_64')
url="https://cider.sh/"
depends=(gtk3 nss libxss libxtst xdg-utils at-spi2-core libsecret)
optdepends=('libnotify: Playback notifications')
license=('unknown')
conflicts=('cider' 'cider-git')
sha256sums=('d07167bbc274f4eea1d0f23305a2e5f45cea4b2e1555b185e1dbb09c713039d2')

# Download the DEB file (you can also provide a direct link)
source=("file://cider_${pkgver}_amd64.deb")

package() {
  cd "$srcdir"
  bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
  install -d "$pkgdir/usr/bin/"
  ln -sf "/opt/Cider/cider" "${pkgdir}/usr/bin/cider"
}