# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgbase='python-vcstools'
pkgname=('python-vcstools')
_module='vcstools'
pkgver='0.1.42'
pkgrel=1
pkgdesc="VCS/SCM source control library for svn, git, hg, and bzr"
url="http://wiki.ros.org/vcstools"
depends=('python' 'python-dateutil' 'python-yaml')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/82/12/6d303e4a882093f16b52538d294596b1683823b62a7dc47c86ce273fae93/vcstools-0.1.42.tar.gz")
sha256sums=('9e48d8ed8b0fdda739af56e05bf10da1a509cb7d4950a19c73264c770802777a')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
