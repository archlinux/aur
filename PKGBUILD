# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>

pkgname=iqtree-bin
pkgver=3.1.4
pkgrel=1
pkgdesc="Efficient phylogenomic software by maximum likelihood"
_pkgname=iqtree3
arch=('x86_64')
url="https://github.com/iqtree/${_pkgname}"
license=('GPL-2.0-or-later')
depends=()
provides=("iqtree=${pkgver}")
conflicts=('iqtree')
options=('!strip' '!debug')
source=("${pkgname}-${pkgver}-Linux-intel.tar.gz::${url}/releases/download/v${pkgver}/iqtree-${pkgver}-Linux-intel.tar.gz")
sha256sums=('d422cb2b8f04825faea753afda25c60de6611537d07ec8fcd0033e70cb042839')

# Upstream ships a statically-linked binary (ldd: not a dynamic executable),
# so there are no runtime shared-library deps and no build step.

package() {
    cd "$srcdir"
    install -Dm755 "iqtree-${pkgver}-Linux-intel/bin/${_pkgname}" "$pkgdir/usr/bin/${_pkgname}"
}
