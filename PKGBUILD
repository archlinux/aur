# Maintainer: Specter119 <spcter119 AT gmail.com>
# Contributor: Berturion@free.fr>

pkgname=switchhosts-bin
pkgver=4.1.1
pkgrel=1
pkgdesc='Switch hosts quickly!'
arch=(x86_64)
url=https://github.com/oldj/SwitchHosts
license=(MIT)
options=(!strip)
depends=(
  gtk3
  libnotify
  nss
  libxss
  libxtst
  xdg-utils
  at-spi2-core
  util-linux-libs
  libsecret
)
optdepends=(libappindicator-gtk3)
source=($url/releases/download/v4.1.1/SwitchHosts_linux_amd64_4.1.1.6077.deb)
sha256sums=('1793245d257818e0a29ab4ea1481af06f56fbbefc96981f9f3b2eb77755ffb67')

package() {
    bsdtar -xf $srcdir/data.tar.xz -C $pkgdir
    mkdir -p $pkgdir/usr/share/pixmaps/
    mv $pkgdir/usr/share/{icons/hicolor/0x0/apps,pixmaps}/switchhosts.png
    rm -rf $pkgdir/usr/share/icons
}
