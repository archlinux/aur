# Maintainer: tee < teeaur at duck dot com >
pkgname=starling-office-bin
pkgver=0.1.0
pkgrel=1
pkgdesc='Documents, presentations, and spreadsheets in one free, open source suite'
arch=(x86_64)
url='https://starling.build'
license=(Apache-2.0)
depends=(bash glib2 glibc gtk3 hicolor-icon-theme libinput wayland zlib)
source=("https://github.com/starling-build/starling/releases/download/office-v$pkgver/starling-office_${pkgver}_amd64.deb")
b2sums=('cc276fa98cc94ed49a8826d69fc471478cdd9d8d0241640bcc67b04ae162c0e50856802429aa8ece1224f850ee67887fcb845bfbbbe5ee3e86d62f706d43613e')

package() {
  tar -xf data.tar.zst -C "$pkgdir"
  cd "$pkgdir"
  chmod 755 usr usr/bin usr/lib
  chmod -R 755 usr/share
  chmod 775 usr/share/doc/starling-office
}
