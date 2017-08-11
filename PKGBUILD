# Contributor: holos

pkgname=dcamprof
pkgver=1.0.5
pkgrel=1
pkgdesc='A digital camera profiling tool'
arch=('i686' 'x86_64')
url="http://www.ludd.ltu.se/~torger/dcamprof.html"
license=('GPL3')
depends=('lcms2')
source=("http://www.ludd.ltu.se/~torger/files/dcamprof-$pkgver.tar.bz2")
sha256sums=('98c01df1ae1ae1d1166f04fda24beab8052fe3fa768cfd8077e820186e1c7013')

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
