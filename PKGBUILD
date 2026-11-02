# Maintainer: taotieren <admin@taotieren.com>
# Contributor: CuVoodoo <pcb-rnd@cuvoodoo.info>

pkgname=sch-rnd
pkgver=1.0.11
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
sha256sums=('c1079174618cf2a052ca0762e6ecbd73539b2efba5a8aa9ec2cdcde0229093fd')

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
