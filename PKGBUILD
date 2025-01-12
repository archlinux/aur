# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=vpkedit-bin
pkgver=4.4.0
pkgrel=1
pkgdesc="A library and CLI/GUI tool to create, read, and write several pack file formats (binary release)"
url="https://github.com/craftablescience/VPKEdit"
license=('MIT')
arch=('x86_64')
depends=('hicolor-icon-theme' 'xcb-util-cursor')
provides=("vpkedit")
conflicts=("vpkedit")
source=("vpkedit-$pkgver.zip::$url/releases/download/v$pkgver/VPKEdit-Linux-Installer-gcc-Release.zip")
sha256sums=('4f0bba37edb2e2c02d06ff169fad267f1ba3be4422005bbf28f46561cf467fd2')

package() {
  ar x VPKEdit-$pkgver-Linux.deb
  tar --use-compress-program=unzstd -xf data.tar.zst -C "$pkgdir"
  install -Dm644 $pkgdir/opt/vpkedit/LICENSE -t "$pkgdir/usr/share/licenses/vpkedit"
}
