# Maintainer: Szymon Scholz <first name last name [at] gmail [dot] com>

pkgname='emulsion-bin'
pkgver='9.0'
pkgrel='1'
pkgdesc='A fast and minimalistic image viewer'
arch=('x86_64')
conflicts=('emulsion')
provides=('emulsion')
makedepends=(
  'coreutils'
  'tar'
)
optdepends=(
  'hicolor-icon-theme: hicolor theme hierarchy' 
)
url='https://arturkovacs.github.io/emulsion-website/'
license=('MIT')
source=(
  "https://github.com/ArturKovacs/emulsion/releases/download/v$pkgver/Emulsion-Linux.deb-v$pkgver.deb"
)
md5sums=('fde7100a3764cf25eca0fbd0f30c860d')

_mirror() {
  install "$1" "usr/$2" "$pkgdir/usr/$2"
}

package() {
  #msg2 'Extracting data...'
  tar xf data.tar.gz

  #msg2 'Installing...'
  install -Dm644 usr/lib/emulsion/LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  _mirror -Dm755 bin/emulsion
  _mirror -Dm755 share/applications/emulsion.desktop
  _mirror -Dm644 share/icons/hicolor/256x256/apps/emulsion.png
}
