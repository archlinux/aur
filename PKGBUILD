# Maintainer: Hans-Nikolai Viessmann <hv15 AT hw.ac.uk>
pkgname='easybuild-framework-git'
pkgver=3.5.1.r14.g5774d360d
pkgrel=2
pkgdesc="A software build and installation framework for HPC systems (development)"
arch=('any')
group='easybuild-git'
url="https://github.com/easybuilders"
license=('GPL')
depends=('python2' 'python2-vsc-base' 'env-modules-tcl')
optdepends=('lmod: another module management tool'
            'fpm: Generate packages of your modules to be installed later'
	        'easybuild-easyconfigs-git: collection of build parameters'
            'easybuild-easyblocks-git: collection of module recipes')
makedepends=('git' 'python2-setuptools')
source=('git+https://github.com/easybuilders/easybuild-framework.git#branch=develop')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/easybuild-framework"

	printf "%s" "$(git describe --long | sed 's/\([^-]*-g\)/r\1/;s/.*v\(.*\)$/\1/;s/-/./g')"
}

package() {
	cd "$srcdir/easybuild-framework"
    python2 setup.py install --root "$pkgdir"
}
