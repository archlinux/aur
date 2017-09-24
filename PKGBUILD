## ldm PKGBUILD
# Maintainer: The Lemon Man

pkgname=ldm
pkgver=0.7
pkgrel=2
pkgdesc="A lightweight device mounter"
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/LemonBoy/ldm"
license=('MIT')
depends=('udev' 'util-linux' 'glib2')
provides=('ldm')
conflicts=('ldm-git')
install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz"::"http://github.com/lemonboy/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('fb464bffec5b7d0680009b43a95881e8c02ec07e84d6f7fb05206d666dc44bdb')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
}

build() {
    export PATH=$PATH:/usr/bin/core_perl
    cd "$srcdir/$pkgname-$pkgver"
    make
}

package() {
    export PATH=$PATH:/usr/bin/core_perl
    cd "$srcdir/$pkgname-$pkgver"
    make PREFIX=/usr DESTDIR="$pkgdir" install

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

