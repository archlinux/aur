# Maintainer: Hoàng Văn Khải <hvksmr1996@gmail.com>

pkgname='emulsion-bin'
pkgver='6.0'
pkgrel='1'
pkgdesc='A fast and minimalistic image viewer'
arch=('x86_64')
conflicts=('emulsion')
provides=('emulsion')
makedepends=(
  'coreutils'
  'tar'
)
url='https://arturkovacs.github.io/emulsion-website/'
license=('MIT')
source=(
  "https://github.com/ArturKovacs/emulsion/releases/download/v$pkgver/Emulsion-Linux.deb-v$pkgver.deb"
)
sha512sums=('SKIP')

_mirror() {
  install "$1" "usr/$2" "$pkgdir/usr/$2"
}

package() {
  msg2 'Extracting data...'
  tar xf data.tar.gz

  msg2 'Installing...'
  install -Dm644 usr/lib/emulsion/LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  _mirror -Dm755 bin/emulsion
  _mirror -Dm755 share/applications/emulsion.desktop
  _mirror -Dm644 share/icons/hicolor/256x256/apps/emulsion.png
}
