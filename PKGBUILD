# Contributor: BinkyTheClown <binky_at_archlinux_dot_us>
# Contributor: alzen <mynick2(at)gmail(dot)com>
# Maintainer: Jose Riha <jose1711 gmail com>
pkgname=gkrellm-fmonitor
pkgver=1.0
pkgrel=1
pkgdesc="A simple but useful gkrellm plugin displaying lines from a text file"
url="https://github.com/jmakovicka/gkrellm-fmonitor"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gkrellm')
source=(https://github.com/jmakovicka/gkrellm-fmonitor/archive/v${pkgver}.tar.gz)
md5sums=('4b2cac484c567bda608fd36fd671cdc0')

build() {
  cd $srcdir/$pkgname-$pkgver
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  install -m755 -D fmonitor.so $pkgdir/usr/lib/gkrellm2/plugins/fmonitor.so
}
