# Maintainer: Prurigro

pkgname=libmemcache
pkgver=1.4.0.rc2
pkgrel=1
pkgdesc="the C API for memcached"
url="http://people.freebsd.org/~seanc/${pkgname}"
license=('MIT')
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
depends=('glibc')
source=("${url}/$pkgname-$pkgver.tar.bz2")
sha512sums=('4b8c09c425d48d0ad040d3f01ec3c0d88babefb702b666d5cb3d10eac9993be88d00120b57b6224f7d55ae979d3136de10d5ddc793d9aa7f8b9531b5d79449d0')

build() {
    cd $pkgname-$pkgver
    ./configure --prefix=/usr
    make
}

package() {
    cd $pkgname-$pkgver
    make DESTDIR="${pkgdir}" install
    install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
