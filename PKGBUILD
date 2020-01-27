# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

pkgname=plumed-patches
pkgver=0.1.3
pkgrel=1
pkgdesc="Additional patches for PLUMED"
url="http://www.plumed.org/"
license=('GPL')
arch=(any)
depends=('plumed')
optdepends=('plumed-mpi')
source=("namd-git.config"
        "namd-git.diff")
md5sums=('b86e6eb88be3f087299bbd8231e15539'
         'f74ede20053ddedb1f93498c125c2bd0')

package() {
    install -Dm644 ${srcdir}/namd-git.diff ${pkgdir}/usr/lib/plumed/patches/namd-git.diff
    install -Dm644 ${srcdir}/namd-git.config ${pkgdir}/usr/lib/plumed/patches/namd-git.config

    if [ -d "/usr/lib/plumed-mpi" ]; then
        install -Dm644 ${srcdir}/namd-git.diff ${pkgdir}/usr/lib/plumed-mpi/patches/namd-git.diff
        install -Dm644 ${srcdir}/namd-git.config ${pkgdir}/usr/lib/plumed-mpi/patches/namd-git.config
    fi
}
