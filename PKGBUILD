## ldm PKGBUILD
# Maintainer: The Lemon Man

pkgname=ldm
pkgver=0.6.3
pkgrel=2
pkgdesc="A lightweight device mounter"
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/LemonBoy/ldm"
license=('MIT')
depends=('udev' 'glib2')
provides=('ldm')
conflicts=('ldm-git')
install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz"::"http://github.com/lemonboy/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('7e5e2b406bc627d4df7676b470ead6af75739ce96dc283e25467bb123b2717d9')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir" install

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

