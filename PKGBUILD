# Maintainer: Marius Schiffer <marius.schiffer@gmail.com>
pkgname=fpart
pkgver=1.4.0
pkgrel=1
pkgdesc='A tool that helps you sort file trees and pack them into bags, like dirsplit'
arch=('x86_64')
url='https://github.com/martymac/fpart'
license=('custom:BSD 2-clause')
source=("fpart-${pkgver}.tar.gz::https://github.com/martymac/fpart/archive/fpart-${pkgver}.tar.gz")
sha256sums=('da4cd97365a2ebb3d0ee7e634c022eb21321ee5b6ab213d796fcbb01f28d9759')

build() {
  cd fpart-fpart-$pkgver
  autoreconf -i
  ./configure --prefix=/usr
  make
}

package() {
  cd fpart-fpart-$pkgver
  make DESTDIR="$pkgdir/" install
  # Install license file
  install -m644 -D COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
