# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=vpkedit-bin
pkgver=4.3.0
pkgrel=1
pkgdesc="A library and CLI/GUI tool to create, read, and write several pack file formats (binary release)"
url="https://github.com/craftablescience/VPKEdit"
license=('MIT')
arch=('x86_64')
depends=('hicolor-icon-theme' 'xcb-util-cursor')
provides=("vpkedit")
conflicts=("vpkedit")
source=("vpkedit-$pkgver.zip::$url/releases/download/v$pkgver/VPKEdit-Linux-Installer-gcc-Release.zip")
sha256sums=('90477756432aa4d91ba4af353198d7b5ea1bc9566ba40beaca4b28aad30d8cd4')

package() {
  ar x VPKEdit-$pkgver-Linux.deb
  tar --use-compress-program=unzstd -xf data.tar.zst -C "$pkgdir"
  install -Dm644 $pkgdir/opt/vpkedit/LICENSE -t "$pkgdir/usr/share/licenses/vpkedit"
}
