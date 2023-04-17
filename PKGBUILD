# Maintainer: Tomasz Zok <tomasz dot zok at gmail dot com>
pkgname=namd-multicore-bin
pkgver=3.0b2
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
md5sums=('bd30ad108a61677cb9f439c74325f594')

package() {
    for executable in charmrun flipbinpdb flipdcd namd3 psfgen sortreplicas; do
        install -Dm755 ${srcdir}/NAMD_${pkgver}_Linux-x86_64-multicore/${executable} ${pkgdir}/usr/bin/${executable}
    done
}
