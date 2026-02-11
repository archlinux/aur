# Maintainer: Patrick McCarty <pnorcks at gmail dot com>

pkgname=gawk-json
_project=gawkextlib
pkgver=2.1.0
pkgrel=1
pkgdesc="GAWK extension - interface to RapidJSON for reading/writing JSON"
arch=('x86_64' 'aarch64')
url="https://sourceforge.net/projects/gawkextlib/"
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc')
makedepends=('gawk>=4.2.1' 'gawkextlib' 'rapidjson')
source=("https://downloads.sourceforge.net/$_project/$pkgname-$pkgver.tar.gz")
md5sums=('f40e8ff5309787c0c76aacf6d2aa4eab')
sha256sums=('478b22124c6ff4901826fbe8f6cc91b26000bb7499d737493cd4cbc1b734c2e2')

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
