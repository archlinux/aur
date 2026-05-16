# Maintainer: adamanteye <adamanteye@disroot.org>
pkgname=tunet-bash
pkgver=1.4.3
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
sha256sums=('838ec9d3033ac56e239afad9ae09122819d773029c8f4cef8c1ac61953ad223b')
package() {
    cd "$srcdir/$pkgname-$pkgver"
    make destdir=$pkgdir prefix=/usr init=systemd install >/dev/null 2>&1
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
