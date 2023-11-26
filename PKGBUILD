# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>
# Contributor: Luis Martinez <luis dot martinez at tuta dot io>
# Contributor: Szymon Scholz <first name last name [at] gmail [dot] com>

pkgname=emulsion-bin
pkgver=10.4
pkgrel=1
pkgdesc="A fast and minimalistic image viewer (binary release)"
url="https://github.com/ArturKovacs/emulsion"
arch=('x86_64')
license=('MIT')
depends=('hicolor-icon-theme' 'libavif')
provides=("emulsion")
conflicts=("emulsion")
source=("$url/releases/download/v$pkgver/Emulsion-Linux.deb-v$pkgver.deb")
sha256sums=('823fde86860ded2335c59114fc377fc02d14738ba5c1040cce54c501f5516a3f')

package() {
  tar -C "$pkgdir" -xf data.tar.gz
  install -Dm644 "$pkgdir/usr/lib/emulsion/LICENSE.txt" -t "$pkgdir/usr/share/licenses/emulsion"
# Fix error
  ln -s /usr/lib/libdav1d.so "$pkgdir/usr/lib/libdav1d.so.6"
}
