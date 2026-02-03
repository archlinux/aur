# Maintainer: adamanteye <adamanteye@disroot.org>
pkgname=tunet-bash
pkgver=1.4.0
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
sha256sums=('42ee546f40f439c1d261f158bc696f78ffc0735689531449b4292822ba9db168')
package() {
    cd "$srcdir/$pkgname-$pkgver"
    make destdir=$pkgdir prefix=/usr init=systemd install >/dev/null 2>&1
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
