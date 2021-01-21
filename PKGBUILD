# Maintainer: Pavle Portic <pavle.portic@tilda.center>
pkgbase='python-sphinx-revealjs'
pkgname=('python-sphinx-revealjs')
_module='sphinx-revealjs'
pkgver='1.0.0'
pkgrel=1
pkgdesc="Sphinx extension with theme to generate Reveal.js presentation"
url="https://github.com/attakei/sphinx-revealjs"
depends=('python')
makedepends=('python-setuptools')
license=('APACHE')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('cf87e587a4fc8fbda7cc6a1233bfb0441a5b3add801ad545b0c2a19258322659')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
