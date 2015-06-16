# Maintainer: David Plassmann <arch[at]plassmann.biz>
pkgname=xping-git
pkgver=20150222
pkgrel=1
pkgdesc="A simple ping program continiously probing multiple hosts using icmp-echo"
url="https://github.com/martintopholm/xping"
arch=('any')
license="THE BEER-WARE LICENSE"
depends=('libevent')
source=("git://github.com/martintopholm/xping.git")
conflicts=('xping')
md5sums=('SKIP')
install='xping.install'
CPPFLAGS="-Wall -Werror -I/usr/local/include"
pkgrelname=xping

build() {
    cd "$pkgrelname"
    make
}

package() {
    cd "$pkgrelname"
    install -Dm4555 "$srcdir/$pkgrelname/$pkgrelname" "$pkgdir/usr/bin/$pkgrelname"
    install -Dm4555 "$srcdir/$pkgrelname/$pkgrelname-http" "$pkgdir/usr/bin/$pkgrelname-http"
    install -Dm444 "$srcdir/$pkgrelname/$pkgrelname.8.gz" "$pkgdir/usr/share/man/man8/$pkgrelname.8.gz"
}
