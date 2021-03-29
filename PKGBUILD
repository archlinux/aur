# Maintainer: Pavle Portic <archlinux@theedgeofrage.com>

pkgbase='python-inject'
pkgname=('python-inject')
_module='Inject'
pkgver='4.3.1'
pkgrel=1
pkgdesc="Python dependency injection framework"
url="https://github.com/ivankorobkov/python-inject"
license=('APACHE')
arch=('any')

depends=('python')
makedepends=('python-setuptools')

source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('7f996f2c9ed2082af776ddf6b528d97036898ac63040385feb1d12286a73c3cc')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
