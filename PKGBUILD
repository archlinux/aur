# Maintainer: Sumner Evans <sumner.evans98 at gmail dot com>

pkgbase=('rst2beamer')
pkgname=('rst2beamer')
_module='rst2beamer'
pkgver='0.6.6'
pkgrel=1
pkgdesc='msmtp wrapper allowing for offline use'
url='www.agapow.net/software/rst2beamer'
depends=(
    'python'
)
makedepends=('python-setuptools')
license=('GPL')
arch=('any')
source=('https://files.pythonhosted.org/packages/source/r/rst2beamer/rst2beamer-0.6.6.tar.gz')
sha256sums=('25faef1a0657afb4af423db568cdeebff44c4edc74214ba7d1aad7a45ea72254')


build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
