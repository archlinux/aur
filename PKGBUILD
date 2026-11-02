# Maintainer: taotieren <admin@taotieren.com>
# Contributor: CuVoodoo <pcb-rnd@cuvoodoo.info>

pkgname=sch-rnd
pkgver=1.0.10
pkgrel=1
pkgdesc="simple, modular, scriptable schematics editor"
url="http://www.repo.hu/projects/sch-rnd/"
arch=($CARCH)
license=('LGPL-2.0-or-later')
depends=(
  'sh'
  'librnd4'
  'libxml2'
)
optdepends=(
  'freetype2: import_ttf plugin'
  'fungw'
)
provides=(${pkgname})
conflicts=(${pkgname})
source=("http://www.repo.hu/projects/$pkgname/releases/$pkgname-$pkgver.tar.gz")
sha256sums=('40e8503c6f3598c51ebe83e6a9109a8e137d093ebfe144f1c590d1ffa01c44f1')

build() {
  cd "$srcdir/$pkgname-$pkgver/"
  ./configure --prefix=/usr
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver/"
  make test
}
 
package() {
  cd "$srcdir/$pkgname-$pkgver/"
  make DESTDIR="$pkgdir/" install
}
