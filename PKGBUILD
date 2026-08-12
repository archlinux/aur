# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>

pkgname=iqtree-bin
pkgver=3.1.3
pkgrel=1
pkgdesc="Efficient phylogenomic software by maximum likelihood (precompiled binary) https://doi.org/10.1093/molbev/msaa015"
_pkgname=iqtree3
arch=('x86_64')
url="https://github.com/iqtree/${_pkgname}"
license=('GPL-2.0-or-later')
depends=()
provides=("iqtree=${pkgver}")
conflicts=('iqtree')
options=('!strip' '!debug')
source=("${pkgname}-${pkgver}-Linux-intel.tar.gz::${url}/releases/download/v${pkgver}/iqtree-${pkgver}-Linux-intel.tar.gz")
sha256sums=('ac87dee78d06b67a1be87fff4a325358d038b5ae947308e52b3cf23829521aa8')

# Upstream ships a statically-linked binary (ldd: not a dynamic executable),
# so there are no runtime shared-library deps and no build step.

package() {
    cd "$srcdir"
    install -Dm755 "iqtree-${pkgver}-Linux-intel/bin/${_pkgname}" "$pkgdir/usr/bin/${_pkgname}"
}
