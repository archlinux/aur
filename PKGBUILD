# Maintainer: Keith Scheiwiller <k.scheiw@gmail.com>

pkgname=notable-insiders-bin
pkgver=1.9.0_beta.9
# No hyphens allowed in pkgver
_notable_ver=1.9.0-beta.9
pkgrel=1
pkgdesc="Insider build of the Notable note-taking app"
arch=('x86_64')
url="https://github.com/notable/notable-insiders/"
license=('UNLICENSED')
groups=()
depends=('c-ares' 'ffmpeg' 'gtk3' 'http-parser' 'libevent' 'libvpx' 'libxslt' 'libxss'
         'minizip' 'nss' 're2' 'snappy' 'libnotify' 'libappindicator-gtk3')
makedepends=()
optdepends=()
provides=('notable')
conflicts=('notable-bin')
replaces=()
backup=()
options=()
install='notable.install'
changelog=''
source=("https://github.com/notable/notable-insiders/releases/download/v${_notable_ver}/notable-${_notable_ver}.pacman")
noextract=()
sha256sums=('b9f5d383ed90785dc3b82157869cf1689a3b4d1a5fee663e36661374a9e7d994')

package() {
  # SUID chrome-sandbox for Electron 5+
  chmod 4755 '/opt/Notable/chrome-sandbox' || true

  mv usr "$pkgdir"
  mv opt "$pkgdir"
  mkdir "$pkgdir"/usr/bin/

  ln -s /opt/Notable/notable "$pkgdir"/usr/bin/notable
}
