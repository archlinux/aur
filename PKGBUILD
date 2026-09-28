# Maintainer: Egor Tensin <egor@tensin.name>
pkgname=tag-release
pkgver=0.4.5
pkgrel=1
pkgdesc='Automate creation of semantic versioning tags'
arch=(any)
url="https://github.com/egor-tensin/$pkgname"
license=(MIT)
depends=(python)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
md5sums=(SKIP)

package() {
    cd -- "$srcdir"

    install -D -m 0644 -t "$pkgdir/usr/share/doc/$pkgname" ../README.Arch

    cd -- "$pkgname-$pkgver"

    install -D -m 0644 -t "$pkgdir/usr/share/$pkgname" LICENSE.txt
    install -D -m 0644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
    install -D -m 0755 -T src/release.py "$pkgdir/usr/bin/$pkgname"
}
