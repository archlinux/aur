# Contributor : Mathieu Pasquet <mathieuivi@gmail.com>
pkgname=wmforkplop
pkgver=0.9.3
pkgrel=6
pkgdesc="A mixture between wmhdplop and the great wmtop."
arch=('i686' 'x86_64')
url="http://hules.free.fr/wmforkplop/"
license=(GPL)
depends=('imlib2' 'libgtop>=2')
source="http://hules.free.fr/wmforkplop/$pkgname-$pkgver.tar.gz"
md5sums=('acee135833a4a5be5d31b8d01a7435ea')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i 's,imlib2-config --,pkg-config imlib2 --,' configure
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr 
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  # DESTDIR is buggy
  make prefix=$pkgdir/usr install
}
