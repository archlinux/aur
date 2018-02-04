# Maintainer: Hans-Nikolai Viessmann <hv15 AT hw.ac.uk>
pkgname='easybuild-easyconfigs-git'
pkgver=3.5.1.r142.g0c1a5150e
pkgrel=1
pkgdesc="A software build and installation framework for HPC systems"
arch=('any')
groups=('easybuild-git')
url="https://github.com/easybuilders/easybuild-easyconfigs"
license=('GPL')
depends=('python2' 'easybuild-easyblocks-git')
makedepends=('git' 'python2-setuptools')
source=('git+https://github.com/easybuilders/easybuild-easyconfigs.git#branch=develop')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/easybuild-easyconfigs"
    printf "%s" "$(git describe --long | sed 's/\([^-]*-g\)/r\1/;s/.*v\(.*\)$/\1/;s/-/./g')"
}

package() {
    cd "$srcdir/easybuild-easyconfigs"
    python2 setup.py install --root "$pkgdir"
}
