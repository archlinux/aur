# Maintainer: Matthias Mailänder <matthias@mailaender.name>

pkgbase='python-style50'
pkgname=('python-style50')
_module='style50'
pkgver='2.10.3'
pkgrel=1
pkgdesc="Command-line program to check code against the CS50 style guide."
url="https://github.com/cs50/style50"
depends=('python' 'icdiff' 'autopep8' 'python-jsbeautifier')
makedepends=('python-build' 'python-installer')
optdepends=('python-babel')
license=('GPLv3')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/${_module/-/_}-$pkgver.tar.gz")
sha256sums=('e2cf432a52797014ef0cecb101f98d0b1eb5959f97cd765338bf31da8640cf5a')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
