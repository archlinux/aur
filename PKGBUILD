# Maintainer: adamanteye <adamanteye@disroot.org>
pkgname=tunet-bash
pkgver=1.3.3
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
sha256sums=('1776435dd0aa789c8105e5e450da11f702ddf4daaf503be54bc73b31e25e3dab')
package() {
    cd "$srcdir/$pkgname-$pkgver"
    make destdir=$pkgdir prefix=/usr init=systemd install >/dev/null 2>&1
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
