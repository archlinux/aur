# Maintainer: Yigit Sever <yigit at yigitsever dot com>
# Contributor: The Lemon Man

pkgname=ldm
pkgver=0.8
pkgrel=1
pkgdesc="A lightweight device mounter"
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/LemonBoy/ldm"
license=('MIT')
depends=('udev' 'util-linux' 'glib2')
provides=('ldm')
conflicts=('ldm-git')
install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz"::"http://github.com/lemonboy/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('e471453e6ae9fa91d6150fe13c01587dd8e15a3f64665d0556ad7e8398dc46ef')

build() {
    export PATH=$PATH:/usr/bin/core_perl
    cd "$srcdir/$pkgname-$pkgver"
    make
}

package() {
    export PATH=$PATH:/usr/bin/core_perl
    cd "$srcdir/$pkgname-$pkgver"
    make PREFIX=/usr SBINDIR=/usr/bin DESTDIR="$pkgdir" install

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

