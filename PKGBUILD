# Maintainer: alex3236 <me@alex3236.moe>
pkgname=genoffice-bin
pkgver=0.11.919
pkgrel=1
pkgdesc="Free, open-source AI office suite: docs, sheets, slides, PDF and markdown editors"
arch=('x86_64')
url="https://github.com/genspark-ai/genoffice"
license=('Apache-2.0')
options=('!debug')
provides=('genoffice')
conflicts=('genoffice')
depends=(
  'alsa-lib'
  'at-spi2-core'
  'gtk3'
  'libcups'
  'libnotify'
  'libsecret'
  'libxss'
  'libxtst'
  'nodejs'
  'nss'
  'util-linux-libs'
  'xdg-utils'
)
optdepends=(
  'libappindicator: tray icon support'
)
source=("https://github.com/genspark-ai/genoffice/releases/download/v${pkgver}/genoffice_${pkgver}_amd64.deb")
sha256sums=('71b3ec16dd4cff097e71c0dd94226118261038d240137d4c82e8766a6d74ec68')

package() {
  cd "$srcdir"
  bsdtar -xf genoffice_${pkgver}_amd64.deb data.tar.xz
  bsdtar -xf data.tar.xz -C "$pkgdir"
  mkdir -p "$pkgdir/usr/bin"
  ln -s /opt/GenOffice/genoffice "$pkgdir/usr/bin/genoffice"
}
