# Maintainer: Tharre <tharre3@gmail.com>

pkgname=grokmirror
pkgver=1.1.0
pkgrel=1
pkgdesc='Framework to smartly mirror git repositories'
url='https://github.com/mricon/grokmirror'
arch=('any')
license=('GPL3')
depends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('e687f5242e15402352d425b350f69508f577aa4466c0c236b0fa1c8bda8c27fe')

build() {
    cd "${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${pkgname}-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
