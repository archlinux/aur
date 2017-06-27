# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgbase=('python2-vcstools')
pkgname=('python2-vcstools')
_module='vcstools'
pkgver='0.1.39'
pkgrel=2
pkgdesc="VCS/SCM source control library for svn, git, hg, and bzr"
url="http://wiki.ros.org/vcstools"
depends=('python2' 'python2-dateutil' 'python2-yaml')
makedepends=('python2-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/v/vcstools/vcstools-${pkgver}.tar.gz")
md5sums=('c20e19e5a5b83520329bd2040bccb375')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
