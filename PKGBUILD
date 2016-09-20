# Contributor: holos

pkgname=dcamprof
pkgver=1.0.1
pkgrel=1
pkgdesc='A digital camera profiling tool'
arch=('i686' 'x86_64')
url="http://www.ludd.ltu.se/~torger/dcamprof.html"
license=('GPL3')
depends=('lcms2')
source=("http://www.ludd.ltu.se/~torger/files/dcamprof-$pkgver.tar.bz2")
sha256sums=('49e7bbd4a869425283537e76b7b7150316ab9567cae6b967c43f87ed0b97d450')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make INSTALL_PREFIX="$pkgdir/usr" install
  install -d "$pkgdir/usr/share/doc/$pkgname/"{img,data-examples}
  install -t "$pkgdir/usr/share/doc/$pkgname" -m644 *.html
  install -t "$pkgdir/usr/share/doc/$pkgname/img" -m644 img/*
  install -t "$pkgdir/usr/share/doc/$pkgname/data-examples" -m644 data-examples/*
}
