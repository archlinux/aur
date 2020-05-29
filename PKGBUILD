# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname='python-defcon'
_pkgname='defcon'
pkgver='0.7.0'
pkgrel=1
pkgdesc='A set of UFO based objects for use in font editing applications'
url="https://pypi.org/project/defcon/"
checkdepends=('python-pytest' 'python-unicodedata2')
depends=('python-fonttools' 'python>=3.8')
makedepends=('python-setuptools')
optdepends=()
license=('MIT')
arch=('any')
source=("https://pypi.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.zip")
sha256sums=('61ed498aad56a2276e5d6e320703d53fd3c76e9d68475814fa88349f7477e207')

check() {
    cd "$_pkgname-$pkgver"
    python setup.py test
}

package() {
    cd "${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
    install -D -m644 License.txt "${pkgdir}/usr/share/licenses/${pkgname}/License.txt"
}
