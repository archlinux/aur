# Maintainer: @RubenKelevra <cyrond@gmail.com>

pkgname='python-scantree'
_module=${pkgname#python-}
pkgver='0.0.1'
pkgrel=1
pkgdesc='Flexible recursive directory iterator: scandir meets glob("**", recursive=True)'
url="https://github.com/andhus/scantree"
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
b2sums=('c891396ca2388457b3394e5e87cb29a92fe16f480e013ef560168cbeef4e2f9a1d9dab055945de34d2086032b12c8fec0d8a56f9dd0cdacd910250840e040490')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/python-scantree/LICENSE"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
