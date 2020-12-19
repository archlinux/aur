# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname='python-ufo2ft'
_pkgname='ufo2ft'
pkgver='2.19.1'
pkgrel=2
pkgdesc="A bridge from UFOs to FontTools objects."
url="https://github.com/googlefonts/ufo2ft"
checkdepends=('python-pytest' 'python-skia-pathops')
depends=('python-booleanoperations' 'python-cffsubr' 'python-compreffor' 'python-cu2qu' 'python-defcon' 'python-fonttools>=4.17.1')
makedepends=('python-setuptools')
optdepends=()
license=('MIT')
arch=('any')
source=("https://pypi.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.zip")
sha256sums=('6062ffed395e0a596e4a524d6bc3186f21ab218b9c874b9efd9f40c8718b0396')

package() {
    cd "${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

check() {
    cd "$_pkgname-$pkgver"
    python setup.py test
}
