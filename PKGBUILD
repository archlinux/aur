# Maintainer: adamanteye <adamanteye@disroot.org>
pkgname=tunet-bash
pkgver=1.4.1
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
sha256sums=('d278dcb38990cfa58eb8f24b9784f07d463114da2dfd9aeeb14121e478d7fccf')
package() {
    cd "$srcdir/$pkgname-$pkgver"
    make destdir=$pkgdir prefix=/usr init=systemd install >/dev/null 2>&1
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
