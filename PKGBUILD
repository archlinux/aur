# Generated using pip2pkgbuild - https://github.com/wenLiangcan/pip2pkgbuild
# Maintainer: loryeam <loryeam@gmail.com>

pkgname=('python-cs50')
_module='cs50'
pkgver='9.0.0'
pkgrel=1
pkgdesc="CS50 library for Python"
arch=('any')
url="https://github.com/cs50/python-cs50"
license=('GPL')
groups=('cs50')
depends=('python' 'python-flask' 'python-sqlalchemy' 'python-sqlparse' 'python-termcolor' 'python-wheel')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('ce3950ed5ca7a3e47d95b4ac1c56ac2ca850ac4b110cc70aebd2826fdca0f188')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
