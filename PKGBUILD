# Maintainer: Tomasz Zok <tomasz dot zok at gmail dot com>
pkgname=namd-multicore-bin
pkgver=3.0b3
pkgrel=1
pkgdesc="NAMD is a parallel molecular dynamics code designed for high-performance simulation of large biomolecular systems"
arch=(x86_64)
url="https://www.ks.uiuc.edu/Research/namd/"
license=(custom)
depends=()
makedepends=()
optdepends=()
provides=(namd)
source=("local://NAMD_${pkgver}_Linux-x86_64-multicore-AVX512.tar.gz")
md5sums=('044dcf416ca6e702350bda95633681d4')

package() {
    for executable in charmrun flipbinpdb flipdcd namd3 psfgen sortreplicas; do
        install -Dm755 ${srcdir}/NAMD_${pkgver}_Linux-x86_64-multicore-AVX512/${executable} ${pkgdir}/usr/bin/${executable}
    done
}
