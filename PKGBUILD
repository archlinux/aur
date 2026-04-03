# Maintainer: Radu Ursache <radu@ursache.ro>
pkgname=proton-run
pkgver=0.1.2
pkgrel=1
pkgdesc="Run Windows executables with Steam Proton outside of Steam"
arch=('any')
url="https://github.com/rursache/proton-run"
license=('MIT')
depends=('bash' 'steam' 'yq')
source=("${pkgname}-${pkgver}.tar.gz::https://codeload.github.com/rursache/proton-run/tar.gz/v${pkgver}")
sha256sums=('2eb6ea81bbf4cffafc7ca7659fbf07252443c2b1a4c41f6592b5d0d4fb4cc500')

package() {
    cd "$srcdir/proton-run-${pkgver}"
    make DESTDIR="$pkgdir" install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
