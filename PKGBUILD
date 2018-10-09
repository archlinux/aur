# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgbase='python-vcstools'
pkgname=('python-vcstools')
_module='vcstools'
pkgver='0.1.40'
pkgrel=1
pkgdesc="VCS/SCM source control library for svn, git, hg, and bzr"
url="http://wiki.ros.org/vcstools"
depends=('python' 'python-dateutil' 'python-yaml')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/v/vcstools/vcstools-${pkgver}.tar.gz")
md5sums=('ae14744e5b242e9073b7a7b81f1e72c3')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
