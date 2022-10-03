# Maintainer: Pavle Portic <archlinux@theedgeofrage.com>

pkgbase='python-sphinx-revealjs'
pkgname=('python-sphinx-revealjs')
_module='sphinx-revealjs'
pkgver='2.2.0'
pkgrel=1
pkgdesc="Sphinx extension with theme to generate Reveal.js presentation"
url="https://github.com/attakei/sphinx-revealjs"
license=('APACHE')
arch=('any')

depends=('python' 'python-sphinx' 'python-docutils')
makedepends=('python-setuptools')

source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('c508d517df650386f0599c2108940731892abd8fa0c24642111ed1271120184d')


build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
