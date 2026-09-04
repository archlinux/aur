# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>

pkgname=raxml-ng-bin
_pkgname=raxml-ng
pkgver=2.0.3
pkgrel=1
pkgdesc="Phylogenetic tree inference tool which uses maximum-likelihood (ML) optimality criterion"
arch=('x86_64')
url='https://github.com/amkozlov/raxml-ng'
license=('AGPL-3.0-only')
depends=()
provides=("raxml-ng=${pkgver}")
conflicts=('raxml-ng' 'raxml-ng-mpi')
options=('!strip' '!debug')
source=("${url}/releases/download/${pkgver}/raxml-ng_v${pkgver}_linux_x86_64.zip")
sha256sums=('d660cebe2a083de6c20d9354968803b8fd10be206f625be2393997d0abe98105')

# Upstream ships a statically-linked binary (ldd: statically linked), so there
# are no runtime shared-library deps and no build step. The release zip bundles
# LICENSE.txt, so no separate license fetch is needed.

package() {
    cd "$srcdir"
    install -Dm755 "${_pkgname}" "$pkgdir/usr/bin/${_pkgname}"
    install -Dm644 "LICENSE.txt" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE.txt"
}
