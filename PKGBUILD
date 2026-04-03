# Maintainer: Radu Ursache <radu@ursache.ro>
pkgname=proton-run
pkgver=0.1.1
pkgrel=1
pkgdesc="Run Windows executables with Steam Proton outside of Steam"
arch=('any')
url="https://github.com/rursache/proton-run"
license=('MIT')
depends=('bash' 'steam' 'yq')
source=("${pkgname}-${pkgver}.tar.gz::https://codeload.github.com/rursache/proton-run/tar.gz/v${pkgver}")
sha256sums=('e1cb0783e58ab6c4e7cc358f5b6cb54dd5be213ce3917b1bc4bba78084677fae')

package() {
    cd "$srcdir/proton-run-${pkgver}"
    make DESTDIR="$pkgdir" install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
