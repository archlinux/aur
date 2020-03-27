# Maintainer: Alex Hirzel <alex at hirzel period us>

pkgbase='roamer'
pkgname='roamer'
pkgver='0.3.2'
pkgrel=1
pkgdesc="plain-text file manager"
url="https://github.com/abaldwin88/roamer/"
depends=('python')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('db1c7576ba6f01402167b5519a60cff7')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
