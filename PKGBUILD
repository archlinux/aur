# Maintainer: @RubenKelevra <cyrond@gmail.com>

pkgname='python-dirhash'
_module=${pkgname#python-}
pkgver='0.2.1'
pkgrel=2
pkgdesc="Python module and CLI for hashing of file system directories."
url="https://github.com/andhus/dirhash-python"
makedepends=('python-setuptools')
depends=('python')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
b2sums=('37ec46bc342c34c910137241b759b627b7dddb2129ac100eae7d97281ab556a42343b5d73b13be4c160ec60ccdc06f5ba6d406b2c9340108869bda0744de6c90')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/python-dirhash/LICENSE"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
