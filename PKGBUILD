# Maintainer: Hans-Nikolai Viessmann <hv15 AT hw.ac.uk>
pkgname='easybuild-easyblocks-git'
pkgver=3.5.1.r4.g2cab3dea
pkgrel=2
pkgdesc="A software build and installation framework for HPC systems"
arch=('any')
groups=('easybuild-git')
url="https://github.com/easybuilders/easybuild-easyblocks"
license=('GPL')
depends=('python2' 'easybuild-framework-git')
makedepends=('git' 'python2-setuptools')
source=('git+https://github.com/easybuilders/easybuild-easyblocks.git#branch=develop')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/easybuild-easyblocks"
    printf "%s" "$(git describe --long | sed 's/\([^-]*-g\)/r\1/;s/.*v\(.*\)$/\1/;s/-/./g')"
}


package() {
    cd "$srcdir/easybuild-easyblocks"
    python2 setup.py install --root "$pkgdir" --optimize=1
}
