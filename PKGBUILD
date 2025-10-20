# Maintainer: adamanteye <ada@adamanteye.cc>
pkgname=tunet-bash
pkgver=1.3.0
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
sha256sums=('a5e1ddebddea3b8ca5c2625c9237ceb519db2599a22f5929eef78761ee745880')
package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR=$pkgdir prefix=/usr install >/dev/null 2>&1
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
