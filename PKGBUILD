#Maintener: Aleksandr Vasilev (Wyndace) <opensource@vasilev-aleksandr.ru>

pkgname=dotcd
pkgver=1.0.1
pkgrel=1
pkgdesc="A Dns Over TLS via ControlD and Comss toggler"
arch=('x86_64')
url="https://github.com/Wyndace/dotcd"
license=('MIT')
depends=()
makedepends=('rust' 'cargo' 'libayatana-appindicator')
source=("https://github.com/Wyndace/dotcd/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a8d6dc435f522d747fbb4effef264d1d3220e3cbc254e1831fd79805131cc6b4')

build() {
    cd "$srcdir/dotcd-$pkgver"
    cargo build --release
}

package() {
    cd "$srcdir/dotcd-$pkgver"
    install -Dm755 "target/release/dotcd" "$pkgdir/usr/bin/dotcd"
}
