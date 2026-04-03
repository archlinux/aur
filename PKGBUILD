# Maintainer: Radu Ursache <radu@ursache.ro>
pkgname=proton-run
pkgver=0.1.0
pkgrel=1
pkgdesc="Run Windows executables with Steam Proton outside of Steam"
arch=('any')
url="https://github.com/rursache/proton-run"
license=('MIT')
depends=('bash' 'steam' 'yq')
source=("${pkgname}-${pkgver}.tar.gz::https://codeload.github.com/rursache/proton-run/tar.gz/v${pkgver}")
sha256sums=('9536a37ea03377787f76af7f2265f9a8e90ab12c2de56897c2a8a3d790f8ddbd')

package() {
    cd "$srcdir/proton-run-${pkgver}"
    make DESTDIR="$pkgdir" install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
