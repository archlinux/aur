## ldm PKGBUILD
# Maintainer: The Lemon Man

pkgname=ldm
pkgver=0.6.2
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
sha256sums=('14484ac229f8d6558f007ec1c139e5ada2d3c60230a55f99f939022cfd493c9b')

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

