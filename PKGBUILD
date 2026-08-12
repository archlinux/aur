# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>

pkgname=raxml-ng-bin
_pkgname=raxml-ng
pkgver=2.0.2
pkgrel=1
pkgdesc="A phylogenetic tree inference tool which uses maximum-likelihood (ML) optimality criterion (precompiled binary) https://doi.org/10.1093/bioinformatics/btz305"
arch=('x86_64')
url='https://github.com/amkozlov/raxml-ng'
license=('AGPL3')
depends=()
provides=("raxml-ng=${pkgver}")
conflicts=('raxml-ng' 'raxml-ng-mpi')
options=('!strip' '!debug')
source=("${url}/releases/download/${pkgver}/raxml-ng_v${pkgver}_linux_x86_64.zip")
sha256sums=('af8bd88473dfe0078323fc59f7b90bd7636f6abeef704d049baf2f3e249f904d')

# Upstream ships a statically-linked binary (ldd: statically linked), so there
# are no runtime shared-library deps and no build step. The release zip bundles
# LICENSE.txt, so no separate license fetch is needed.

package() {
    cd "$srcdir"
    install -Dm755 "${_pkgname}" "$pkgdir/usr/bin/${_pkgname}"
    install -Dm644 "LICENSE.txt" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE.txt"
}
