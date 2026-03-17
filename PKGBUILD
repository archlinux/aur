# Maintainer: druid <druid520@codeberg.org>

pkgname=hetrix
pkgver=1.3
pkgrel=1
pkgdesc="Source-based package manager with parallel builds and ZPAQ support"
arch=('x86_64')
url="https://codeberg.org/Druid520/hetrix"
license=('GPL3')
depends=('gcc' 'make' 'git' 'curl' 'cmake' 'zpaq' 'p7zip')
makedepends=()
optdepends=()
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('6b307ea15aab814cb89aa28e2733198aa45f5bacee11f38859fe02ba0cd8e0a1')

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    ./hetrix.sh
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    install -Dm755 hetrix "$pkgdir/usr/bin/hetrix"
    install -Dm755 configgy.sh "$pkgdir/usr/bin/hetrix-configgy"
    install -Dm644 README.md "$pkgdir/usr/share/doc/hetrix/README.md"
    install -Dm644 index.json "$pkgdir/usr/share/hetrix/index.json"
}
