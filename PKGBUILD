# Maintainer: Jiuyang Liu <liujiuyang1994@gmail.com>

pkgname=wake
pkgver=0.16.0
pkgrel=1
pkgdesc="The SiFive wake build tool"
arch=('x86_64')
url="https://github.com/sifive/wake"
license=('custom')
depends=('dash' 'sqlite' 'gmp' 'fuse-common' 're2' 'ncurses5-compat-libs')
optdepends=('re2c'
            'utf8proc')
source=("https://github.com/sifive/wake/releases/download/v0.16.0/wake_$pkgver.tar.xz")
md5sums=('7be63bd44668a6ca252a3ac53c5a1e4e')

prepare() {
  cd $srcdir/$pkgname-$pkgver
}

build() {
  cd $srcdir/$pkgname-$pkgver
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  ./bin/wake 'install "'$pkgdir'/usr"'
  mkdir -p $pkgdir/usr/share/licenses/wake
  install -Dm644 $srcdir/$pkgname-$pkgver/LICENSE* $pkgdir/usr/share/licenses/wake
}
