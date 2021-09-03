# Maintainer: Popolon <popolon@popolon.org>

pkgbase='python-grapheme'
pkgname=('python-grapheme')
_module='grapheme'
pkgver='0.6.0'
pkgrel=1
pkgdesc="Unicode grapheme helpers"
url="https://github.com/alvinlindstam/grapheme"
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('44c2b9f21bbe77cfb05835fec230bd435954275267fea1858013b102f8603cca')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
