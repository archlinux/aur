# Maintainer: Frederik “Freso” S. Olesen <freso.dk@gmail.com>
# Contributor: TDY <tdy@gmx.com>

pkgname=meteorite
pkgver=0.11
pkgrel=3
pkgdesc='A Matroska/MKV repair engine'
arch=('i686' 'x86_64')
url='http://www.mkvrepair.com/'
license=('GPL')
depends=('wxgtk2')
source=("https://downloads.sourceforge.net/$pkgname/Meteorite-v$pkgver-src.tar.bz2"\
        "meteorite.patch")
md5sums=('9f608eee5a8f355beb8b59fb7e0a8718'
         '30b254657da6a01abbab91a7e8ce99d9')

prepare(){
  cd "$srcdir"
  patch -p1 -i $pkgname.patch
}

build() {
  cd "$srcdir/Meteorite"
  make
}

package() {
  cd "$srcdir/Meteorite"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
