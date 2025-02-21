# Maintainer: gsh <gsh20040816@gmail.com>
pkgname=cider2-bin
pkgver=2.6.1
pkgrel=1
pkgdesc="A cross-platform Apple Music experience built on Vue.js and written from the ground up with performance in mind"
arch=('x86_64')
url="https://cider.sh/"
depends=(gtk3 nss libxss libxtst xdg-utils at-spi2-core libsecret)
optdepends=('libnotify: Playback notifications')
license=('unknown')
conflicts=('cider' 'cider-git')
sha256sums=('0e83b90b76fae4a902481d4f6d171ba80fd39bb1b8da4f36418340b53b91eceb')

# Download the DEB file (you can also provide a direct link)
source=("file://cider-linux-x64.deb")

package() {
  cd "$srcdir"
  bsdtar -xf "${srcdir}/data.tar.zst" -C "${pkgdir}/"
  ln -sf "/usr/bin/cider" "${pkgdir}/usr/bin/Cider"
}
