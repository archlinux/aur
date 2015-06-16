# Maintainer: Sebastian Krzyszkowiak <dos@dosowisko.net>
pkgname=superderpy
pkgver=0.1a
pkgrel=1
pkgdesc="A My Little Pony themed arcade game with famous Derpy Hooves as main hero."
arch=('i686' 'x86_64')
url='http://superderpy.com/'
license=('GPL2+')
depends=('allegro')
makedepends=('cmake')
source=(http://www.superderpy.com/download/SuperDerpy-$pkgver.zip)
sha256sums=('22ef54f6c6a22d42a1822fb907344cbdb0205c41403148017e369d5cb64780ed')

build() {
  cd SuperDerpy
  make
}

package() {
  cd SuperDerpy
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/superderpy/data"
  cp bin/superderpy "$pkgdir/usr/share/superderpy"
  echo "#!/bin/sh" > "$pkgdir/usr/bin/superderpy"
  echo "cd /usr/share/superderpy" >> "$pkgdir/usr/bin/superderpy"
  echo "/usr/share/superderpy/superderpy" >> "$pkgdir/usr/bin/superderpy"
  chmod +x "$pkgdir/usr/bin/superderpy"
  cp -r data "$pkgdir/usr/share/superderpy/"
}
