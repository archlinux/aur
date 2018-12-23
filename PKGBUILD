# Maintainer: Sumner Evans <sumner.evans98 at gmail dot com>

pkgbase=('rst2beamer3k')
pkgname=('rst2beamer3k')
_module='rst2beamer3k'
pkgver='0.9.1'
pkgrel=1
pkgdesc='msmtp wrapper allowing for offline use'
url='https://github.com/myint/rst2beamer'
depends=(
    'python'
)
makedepends=('python-setuptools')
license=('GPL')
arch=('any')
source=('https://files.pythonhosted.org/packages/source/r/rst2beamer3k/rst2beamer3k-0.9.1.tar.gz')
sha256sums=('63d9859b20783984034795932c9b14981bea7159add6503cba378c85d9260951')
provides=("rst2beamer")
conflicts=("rst2beamer")

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
