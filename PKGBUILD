# Maintainer: yjzyl9008@gmail.com
# Contributor: Piotr Rogoza <piotr dot r dot public at gmail dot com>

pkgname=tkdnd
_pkgname=$pkgname-release-test
pkgver=2.9.5
pkgrel=1
pkgdesc="add native drag'n'drop capabilities to Tk toolkit"
arch=(i686 x86_64)
url="https://github.com/petasis/tkdnd"
license=("GPL")
depends=('tk')
conflicts=(tkdnd-cvs tkdnd-git)
options=(!emptydirs)
source=("https://github.com/petasis/tkdnd/archive/tkdnd-release-test-v${pkgver}.tar.gz")
sha256sums=('7ab2d1d7c0f57a5dc7f6d5542895b44762a31a01621c9d7f80f3bbd67c7bcc39')

build() {
  cd "$srcdir/$pkgname-$_pkgname-v$pkgver"
  ./configure --prefix=/usr
  make
}
package(){
  cd "$srcdir/$pkgname-$_pkgname-v$pkgver"
  make DESTDIR="$pkgdir/" install
}
