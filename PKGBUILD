# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgbase='python2-vcstools'
pkgname=('python2-vcstools')
_module='vcstools'
pkgver='0.1.42'
pkgrel=2
pkgdesc="VCS/SCM source control library for svn, git, hg, and bzr"
url="http://wiki.ros.org/vcstools"
depends=('python2' 'python2-dateutil' 'python2-yaml')
makedepends=('python2-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('9e48d8ed8b0fdda739af56e05bf10da1a509cb7d4950a19c73264c770802777a')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
