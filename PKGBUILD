# Contributor: holos

pkgname=dcamprof
pkgver=1.0.6
pkgrel=1
pkgdesc='A digital camera profiling tool'
arch=('i686' 'x86_64')
url="http://www.ludd.ltu.se/~torger/dcamprof.html"
license=('GPL3')
depends=('lcms2')
source=("https://torger.se/anders/files/dcamprof-$pkgver.tar.bz2")
sha256sums=('e7540939193b3eb70c1863c1c817b1c4d0495239972e8085597d6793037bab6b')

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
