# Maintainer: tmtaxman <tmtaxman2 at gmail dot com>

pkgname=gogcli
pkgver=0.9.0
pkgrel=1
pkgdesc="Google Suite CLI: Gmail, GCal, GDrive, GContacts."
arch=('x86_64' 'aarch64')
url="https://github.com/steipete/gogcli"
license=('MIT')
provides=('gog')
makedepends=('go' 'make')

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('58163d629da853a79055234f395850149bcb779389104526d40ac400c2318929')

build() {
    cd "$pkgname-$pkgver"
    make
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "bin/gog" -t "$pkgdir/usr/bin/"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
    install -Dm644 CHANGELOG.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
