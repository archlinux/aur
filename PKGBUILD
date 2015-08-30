pkgname=('megacorp')
pkgver=0.5
pkgrel=1
pkgdesc='A console acquire board game'
url='http://sourceforge.net/projects/acquiregame/'
license=('GPL 2')
source=('http://sourceforge.net/projects/acquiregame/files/acquire/0.5.1/megacorp-0.5.1.zip/download'
        'patch.diff')
md5sums=('5df07b58c5aa10d02de292debd070e15'
         'd632b8d3c46f45ca89444efa7dce51fe')
arch=('i686' 'x86_64')

package() {
  cd "$srcdir"
  make install DESTDIR="$pkgdir"
  make install.train DESTDIR="$pkgdir"
}

prepare() {
  cd "$srcdir"
  patch <../patch.diff
}

build() {
  cd "$srcdir"
  make
  make train
}
