# Maintainer: druid <druid520@codeberg.org>

pkgname=hetrix
pkgver=1.3
pkgrel=1
pkgdesc="Source-based package manager with parallel builds and ZPAQ support"
arch=('x86_64')
url="https://codeberg.org/Druid520/hetrix"
license=('GPL3')
depends=('gcc' 'make' 'git' 'curl' 'cmake' 'zpaq' 'p7zip' 'python')
install='hetrix.install'
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('7973e0a53ecbcf0585c87f7f6e2ce3f28c89ae65cae3d4d5982a2d253e9f35f2')

build() {
    cd "$srcdir/hetrix"
    chmod +x hetrix.sh
    ./hetrix.sh --no-seed
}

package() {
    cd "$srcdir/hetrix"
    install -Dm755 hetrix "$pkgdir/usr/bin/hetrix"
    install -Dm755 configgy.sh "$pkgdir/usr/bin/hetrix-configgy"
    install -Dm644 README.md "$pkgdir/usr/share/doc/hetrix/README.md"
    install -Dm644 index.json "$pkgdir/usr/share/hetrix/index.json.example"
}
