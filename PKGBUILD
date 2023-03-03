# Maintainer: tarball <bootctl@gmail.com>

pkgname=wcd
pkgver=6.0.4
pkgrel=1
pkgdesc='A command-line program to change directory fast'
url='https://waterlan.home.xs4all.nl/wcd.html'
arch=(x86_64 aarch64 armv7h)
license=(GPL2)
depends=(ncurses libunistring)

source=(https://waterlan.home.xs4all.nl/wcd/wcd-$pkgver.tar.gz wcd.sh)
sha256sums=('5673645f77505c8d03ca75ffcb32f6a2a86fa1b1e9a8dd9d0a5bd10a202eabf2'
            '59b19ccded26d9ba356b5e8c435faa6f300d9f36aef1436bb25e2311195aeeed')

build() {
  cd wcd-$pkgver/src
  make
}

package() {
  install -Dm755 wcd.sh "$pkgdir"/etc/profile.d/wcd.sh
  cd wcd-$pkgver/src
  make prefix="$pkgdir/usr" install
}
