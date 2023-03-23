# Maintainer: @RubenKelevra <cyrond@gmail.com>

pkgname='python-aiogithubapi'
_module=${pkgname#python-}
pkgver='22.10.1' # REMEMBER TO UPDATE CHANGELOG!
pkgrel=1
changelog='changelog'
pkgdesc="Asynchronous Python client for the GitHub API"
url="https://github.com/ludeeus/aiogithubapi"
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
b2sums=('7971519028bb72b9147b5deed274b4cd3a17bfe2607fc6b00e84942d02e72496437d4e5dcdadbce1ad1c5d374815a5053743b4e2cd92be79965b34b6d8058eb6')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
