# Maintainer: Radu Ursache <radu@ursache.ro>
pkgname=proton-run
pkgver=0.2.1
pkgrel=1
pkgdesc="Run Windows executables with Steam Proton outside of Steam"
arch=('any')
url="https://github.com/rursache/proton-run"
license=('MIT')
depends=('bash' 'steam' 'yq')
source=("${pkgname}-${pkgver}.tar.gz::https://codeload.github.com/rursache/proton-run/tar.gz/v${pkgver}")
sha256sums=('ed53f4a8026377e4e5f13bb2c5f54e1e39f83b96961db1263f5fd5b6742938ac')

package() {
    cd "$srcdir/proton-run-${pkgver}"
    make DESTDIR="$pkgdir" install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
