# Maintainer: Specter119 <spcter119 AT gmail.com>
# Contributor: Berturion@free.fr>

pkgname=switchhosts-bin
pkgver=4.1.2
pkgrel=1
pkgdesc='Switch hosts quickly!'
arch=(x86_64)
url=https://swh.app/
license=(APACHE)
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
source=(https://github.com/oldj/SwitchHosts/releases/download/v4.1.2/SwitchHosts_linux_amd64_4.1.2.6086.deb
	https://github.com/oldj/SwitchHosts/blob/master/src/assets/icon.png
        https://raw.githubusercontent.com/oldj/SwitchHosts/master/LICENSE)
sha256sums=(
  a2898640645392952836b8d8d9e7d3edc135b87e2d15c35c13ad567fb333a8b5
  SKIP
  SKIP
)

package() {
    bsdtar -xf $srcdir/data.tar.xz -C $pkgdir
    mkdir -p $pkgdir/usr/{bin,share/pixmaps}/
    rm -rf $pkgdir/usr/share/doc
    ln -s /opt/SwitchHosts/switchhosts $pkgdir/usr/bin/
    install -Dm644 icon.png $pkgdir/usr/share/pixmaps/switchhosts.png
    install -Dm644 LICENSE $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
}
