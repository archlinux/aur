# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgbase='python2-vcstools'
pkgname=('python2-vcstools')
_module='vcstools'
pkgver='0.1.40'
pkgrel=1
pkgdesc="VCS/SCM source control library for svn, git, hg, and bzr"
url="http://wiki.ros.org/vcstools"
depends=('python2' 'python2-dateutil' 'python2-yaml')
makedepends=('python2-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/v/vcstools/vcstools-${pkgver}.tar.gz")
md5sums=('ae14744e5b242e9073b7a7b81f1e72c3')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
