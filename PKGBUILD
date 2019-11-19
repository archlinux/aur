# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

pkgname=plumed-patches
pkgver=0.1.2
pkgrel=1
pkgdesc="Additional patches for PLUMED"
url="http://www.plumed.org/"
license=('GPL')
arch=(any)
depends=('plumed')
optdepends=('plumed-mpi')
conflicts=('plumed>=2.6')
source=("namd-git.config"
        "namd-git.diff"
        "amber18.config"
        "amber18.diff")
md5sums=('b86e6eb88be3f087299bbd8231e15539'
         'f74ede20053ddedb1f93498c125c2bd0'
         '9e0da596883144b971bd625deb415060'
         '7d4aeeb5d15a343abe93bcf4ec236ba1')

package() {
    install -Dm644 ${srcdir}/namd-git.diff ${pkgdir}/usr/lib/plumed/patches/namd-git.diff
    install -Dm644 ${srcdir}/namd-git.config ${pkgdir}/usr/lib/plumed/patches/namd-git.config

    install -Dm644 ${srcdir}/amber18.diff ${pkgdir}/usr/lib/plumed/patches/amber18.diff
    install -Dm644 ${srcdir}/amber18.config ${pkgdir}/usr/lib/plumed/patches/amber18.config

    if [ -d "/usr/lib/plumed-mpi" ]; then
        install -Dm644 ${srcdir}/amber18.diff ${pkgdir}/usr/lib/plumed-mpi/patches/amber18.diff
        install -Dm644 ${srcdir}/amber18.config ${pkgdir}/usr/lib/plumed-mpi/patches/amber18.config
    fi
}
