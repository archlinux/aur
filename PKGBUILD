# Maintainer: adamanteye <ada@adamanteye.cc>
pkgname=tunet-bash
pkgver=1.2.9
pkgrel=1
pkgdesc="Tsinghua University network authentication utility."
arch=('any')
url='https://github.com/adamanteye/tunet-bash'
license=('MIT')
depends=('bash' 'curl' 'openssl')
optdepends=(
    'pass: for password storing'
    'jq: parse online devices'
)
makedepends=('scdoc')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('07e51e260a04af4a882774354617e4e2f19a435f9d4d8ae5a3b8c585320e593c')
package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR=$pkgdir prefix=/usr install >/dev/null 2>&1
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
