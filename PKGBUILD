# Maintainer: Johan Svensson <johan@loxley.se>
pkgname=xping
pkgver=1.3
pkgrel=3
pkgdesc="A simple ping program continiously probing multiple hosts using icmp-echo"
url="https://github.com/martintopholm/xping"
arch=('x86_64')
license=("THE BEER-WARE LICENSE")
depends=('libevent')
source=("git+https://github.com/martintopholm/$pkgname.git#tag=v$pkgver")
md5sums=('SKIP')
install='xping.install'
CPPFLAGS="-Wall -Werror -I/usr/local/include"

build() {
    cd "$pkgname" || exit 1
    make
}

package() {
    cd "$pkgname" || exit 1
    install -Dm4555 "$srcdir/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm4555 "$srcdir/$pkgname/$pkgname-http" "$pkgdir/usr/bin/$pkgname-http"
    install -Dm444 "$srcdir/$pkgname/$pkgname.8.gz" "$pkgdir/usr/share/man/man8/$pkgname.8.gz"
}
