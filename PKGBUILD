#Maintainer: David McInnis <dave@dave3.xyz>

pkgname=('python-pyamg')
_module='pyamg'
pkgver='3.3.0'
pkgrel=1
pkgdesc="PyAMG: Algebraic Multigrid Solvers in Python"
url="https://github.com/pyamg/pyamg"
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('i686' 'x86_64')
source=("https://files.pythonhosted.org/packages/source/p/pyamg/pyamg-${pkgver}.tar.gz")
sha256sums=('af80053c23c6618da3786f88d1f89fb98714e5ce7f47a1de2cecfdc1f16d18d2')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

check() {
	cd "${srcdir}/${_module}-${pkgver}"
	python setup.py test
}


package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/license.md"
}
