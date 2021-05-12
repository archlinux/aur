# Maintainer: Tomasz Zok <tomasz dot zok at gmail dot com>
pkgname=namd-multicore-bin
pkgver=2.14
pkgrel=1
pkgdesc="NAMD is a parallel molecular dynamics code designed for high-performance simulation of large biomolecular systems"
arch=(x86_64)
url="https://www.ks.uiuc.edu/Research/namd/"
license=(custom)
depends=()
makedepends=()
optdepends=()
provides=(namd)
source=("local://NAMD_${pkgver}_Linux-x86_64-multicore.tar.gz")
md5sums=('5abb6040da5c9e35889bd64a77d46c95')

package() {
    for executable in charmrun flipbinpdb flipdcd namd2 psfgen sortreplicas; do
        install -Dm755 ${srcdir}/NAMD_${pkgver}_Linux-x86_64-multicore/${executable} ${pkgdir}/usr/bin/${executable}
    done
}
