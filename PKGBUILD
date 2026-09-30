# Maintainer: Egor Tensin <egor@tensin.name>
pkgname=tag-release
pkgver=0.4.8
pkgrel=1
pkgdesc='Automate creation of semantic versioning tags'
arch=(any)
url="https://github.com/egor-tensin/$pkgname"
license=(MIT)
makedepends=(make)
depends=(python)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
md5sums=(SKIP)

package() {
    cd -- "$srcdir"
    install -D -m 0644 -t "$pkgdir/usr/share/doc/$pkgname" ../README.Arch

    make -C "$pkgname-$pkgver" install "DESTDIR=$pkgdir"
}
