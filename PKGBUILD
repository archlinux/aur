# Maintainer: Johan Svensson <johan@loxley.se>
pkgname=xping
pkgver=1.3
pkgrel=1
pkgdesc="A simple ping program continiously probing multiple hosts using icmp-echo"
url="https://github.com/martintopholm/xping"
arch=('any')
license="THE BEER-WARE LICENSE"
depends=('libevent')
source=("git://github.com/martintopholm/$pkgname.git#tag=v$pkgver")
md5sums=('SKIP')
install='xping.install'
CPPFLAGS="-Wall -Werror -I/usr/local/include"

build() {
    cd "$pkgname"
    make
}

package() {
    cd "$pkgname"
    install -Dm4555 "$srcdir/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm444 "$srcdir/$pkgname/$pkgname.8.gz" "$pkgdir/usr/share/man/man8/$pkgname.8.gz"
}
