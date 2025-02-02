# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=mangojuice-bin
pkgver=0.8.1
pkgrel=1
pkgdesc="A convenient alternative for setting up Mangohud (binary release)"
url="https://github.com/radiolamp/mangojuice"
license=('GPL-3.0-or-later')
arch=('x86_64')
depends=('libgee' 'libadwaita')
provides=("mangojuice")
conflicts=("mangojuice")
source=("$url/releases/download/$pkgver/mangojuice_${pkgver}-1_amd64.deb")
sha256sums=('6a0a5877ebd8ca6e619b6f098cefb57df791993f70e2ff65ed5d7dc81a628692')

package() {
  ar x mangojuice_${pkgver}-1_amd64.deb
  tar --use-compress-program=unzstd -xf data.tar.zst -C "$pkgdir"
# Clean up
  cd $pkgdir/usr/share
  rm -r doc-base doc/mangojuice/README.Debian
}
