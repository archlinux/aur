# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname='python-ufo2ft'
_pkgname='ufo2ft'
pkgver='2.13.0'
pkgrel=1
pkgdesc="A bridge from UFOs to FontTools objects."
url="https://github.com/googlefonts/ufo2ft"
checkdepends=('python-pytest' 'python-skia-pathops')
depends=('python' 'python-booleanoperations' 'python-compreffor' 'python-cu2qu' 'python-defcon' 'python-fonttools')
makedepends=('python-setuptools')
optdepends=()
license=('MIT')
arch=('any')
source=("https://pypi.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.zip")
sha256sums=('834cb190dfb3b0ef156ca040f3aca24b7ceba0fa73b581bb39b31891ebadfdae'
            '76458f692a5287139a4da870adb55c168e30c9a60a366628e7cf90af9436474a')

prepare() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

#check() {
    #cd "$srcdir/$_pkgname-$pkgver"
    #python setup.py test
#}
