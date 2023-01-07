# Maintainer: Marco A Rojas <marco.rojas@zentek.com.mx>

pkgbase='python-nbterm'
pkgname=('python-nbterm')
_module='nbterm'
pkgver='0.0.13'
pkgrel=1
pkgdesc="A tool for viewing, editing and executing Jupyter Notebooks in the terminal"
url="https://github.com/davidbrochart/nbterm.git"
depends=('python' 'python-kernel-driver' 'python-rich' 'python-pyzmq' 'python-typer')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('99b080c86b6a5121dc4f7333c4bbd89fc5fedc4af8372892ea6d8e396303cf2d')

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
