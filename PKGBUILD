# Maintainer: @RubenKelevra <cyrond@gmail.com>

pkgname='python-securetar'
_module='securetar'
pkgver='2022.2.0'
pkgrel=1
pkgdesc="Python module to handle tarfile backups."
url="https://github.com/pvizeli/securetar"
depends=('python' 'python-cryptography')
license=('Apache')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
b2sums=('332538160613eb59e9c200dad7338a0a8fd99c8b3ca57034750d5887114bda258b7c76e3b261044089ff374e24193d688859063afee8eb2146ad0feb426cfacd')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
