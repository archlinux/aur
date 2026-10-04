# Maintainer: Egor Tensin <egor@tensin.name>
pkgname=config-links
pkgver=2.1.10
pkgrel=1
pkgdesc='Config file sharing'
arch=(any)
url="https://github.com/egor-tensin/$pkgname"
license=(MIT)
makedepends=(make)
depends=(bash)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
md5sums=(SKIP)

package() {
    cd -- "$srcdir"
    install -D -m 0644 -t "$pkgdir/usr/share/doc/$pkgname" "../README.Arch"

    make -C "$pkgname-$pkgver" install DESTDIR="$pkgdir"
}
