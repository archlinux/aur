# Maintainer: adamanteye <adamanteye@disroot.org>
pkgname=tunet-bash
pkgver=1.3.1
pkgrel=1
pkgdesc="Tsinghua University network authentication utility."
arch=('any')
url='https://github.com/adamanteye/tunet-bash'
license=('MIT')
depends=('bash' 'curl' 'openssl' 'jq')
optdepends=(
    'pass: for password storing'
)
makedepends=('scdoc')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('a47f6e8f58a5f8ffa8e407c0217197889d5ba36bb8fcd18bb1a256b07968d8c7')
package() {
    cd "$srcdir/$pkgname-$pkgver"
    make destdir=$pkgdir prefix=/usr init=systemd install >/dev/null 2>&1
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
