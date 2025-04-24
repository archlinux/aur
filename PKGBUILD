# Maintainer: Matthias Mailänder <matthias@mailaender.name>

pkgbase='python-style50'
pkgname=('python-style50')
_module='style50'
pkgver='2.10.4'
pkgrel=1
pkgdesc="Command-line program to check code against the CS50 style guide."
url="https://github.com/cs50/style50"
depends=('python' 'icdiff' 'autopep8' 'python-jsbeautifier')
makedepends=('python-build' 'python-installer')
optdepends=('python-babel')
license=('GPLv3')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/${_module/-/_}-$pkgver.tar.gz")
sha256sums=('13dedcb9e1652c53c4eea68d35df680127abfbc14f98a7dd081b2c7fc39a45d3')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
