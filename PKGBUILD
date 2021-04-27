# Maintainer: Marco A Rojas <marco.rojas@zentek.com.mx>

pkgbase='python-nbterm'
pkgname=('python-nbterm')
_module='nbterm'
pkgver='0.0.7'
pkgrel=1
pkgdesc="A tool for viewing, editing and executing Jupyter Notebooks in the terminal"
url="https://github.com/davidbrochart/nbterm.git"
depends=('python' 'python-rich' 'python-pyzmq' 'python-typer')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('8cf427520b2507cc064cb98c2789317583616481e6816abce930dd45073a6407')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/python-nbterm/LICENSE"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
