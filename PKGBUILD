# Maintainer: Matthias Mailänder <matthias@mailaender.name>

pkgbase='python-lib50'
pkgname=('python-lib50')
_module='lib50'
pkgver='3.1.4'
pkgrel=1
pkgdesc="CS50's own internal library used in many of its tools."
url="https://github.com/cs50/lib50"
depends=('python' 'git' 'python-attrs' 'python-yaml' 'python-pexpect' 'python-requests' 'python-termcolor' )
makedepends=('python-build' 'python-installer' 'python-setuptools')
optdepends=('python-babel')
license=('GPLv3')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/${_module/-/_}-$pkgver.tar.gz")
sha256sums=('fdfba28b3580bccd4bfac86e127628d295f05ac2c08c311850d7dbe7a77ff18d')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
