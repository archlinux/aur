# Maintainer: Pavle Portic <archlinux@theedgeofrage.com>

pkgbase='python-certifi-system-store'
pkgname=('python-certifi-system-store')
_module='certifi-system-store'
pkgver='3021.3.16'
pkgrel=1

pkgdesc="A certifi hack to use system trust store on Linux/FreeBSD"
url="https://github.com/tiran/certifi-system-store"
license=('MPL')
arch=('any')

depends=('python')
makedepends=('python-setuptools')
provides=('python-certifi')
conflicts=('python-certifi')

source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('603be2b260ae2d5d025f584a219087683ff2ddcd09325ebb56b172cd07877057')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
