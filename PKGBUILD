# Maintainer: Patrick McCarty <pnorcks at gmail dot com>

pkgname=gawk-json
_project=gawkextlib
pkgver=2.0.1
pkgrel=3
pkgdesc="GAWK extension - interface to RapidJSON for reading/writing JSON"
arch=('x86_64' 'aarch64')
url="https://sourceforge.net/projects/gawkextlib/"
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc')
makedepends=('gawk>=4.2.1' 'gawkextlib' 'rapidjson')
source=("https://downloads.sourceforge.net/$_project/$pkgname-$pkgver.tar.gz")
md5sums=('f26a4ba358c81e25c3623deb3cb1e018')
sha256sums=('27a4fc0b8bf4f6229fffd9ef98dc90c685de50571723b731ddfc48af0c3a5ee2')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr --enable-silent-rules
  make
}

check() {
  cd "$pkgname-$pkgver"
  make -k check
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
