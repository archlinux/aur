# Maintainer: @RubenKelevra <cyrond@gmail.com>

pkgname='python-securetar'
_module=${pkgname#python-}
pkgver='2023.3.0'
pkgrel=1
pkgdesc="Python module to handle tarfile backups."
url="https://github.com/pvizeli/securetar"
depends=('python' 'python-cryptography')
makedepends=('python-setuptools')
license=('Apache')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
b2sums=('f14409aaff61960cf5318a014f2310b7edd3f27af557a9a2ac20061522b68ffce5c76a312070fda7c36cd78ca15d899222cfc3cfbac286ce1d0afa49ebf26379')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
