# Maintainer: gsh <gsh20040816@gmail.com>
pkgname=cider2-bin
pkgver=2.6.0
pkgrel=2
pkgdesc="A cross-platform Apple Music experience built on Vue.js and written from the ground up with performance in mind"
arch=('x86_64')
url="https://cider.sh/"
depends=(gtk3 nss libxss libxtst xdg-utils at-spi2-core libsecret)
optdepends=('libnotify: Playback notifications')
license=('unknown')
conflicts=('cider' 'cider-git')
sha256sums=('997c09c7c28ff61b3ff9ba8bc76f6feae3027674e540aaceeacf5318d6e1dc9d')

# Download the DEB file (you can also provide a direct link)
source=("file://cider-linux-amd64.deb")

package() {
  cd "$srcdir"
  bsdtar -xf "${srcdir}/data.tar.zst" -C "${pkgdir}/"
  ln -sf "/usr/bin/cider" "${pkgdir}/usr/bin/Cider"
}
