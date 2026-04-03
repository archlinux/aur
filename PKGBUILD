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
sha256sums=('17aea12f3af9923ba1a9ebd0ceeb0e5e85da39d59ef65abc60d24a67b31a897b')

package() {
    cd "$srcdir/proton-run-${pkgver}"
    make DESTDIR="$pkgdir" install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
