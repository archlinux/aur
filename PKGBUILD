# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname='python-defcon'
_pkgname='defcon'
pkgver='0.7.2'
pkgrel=1
pkgdesc='A set of UFO based objects for use in font editing applications'
url="https://pypi.org/project/defcon/"
checkdepends=('python-pytest' 'python-unicodedata2')
depends=('python-fonttools' 'python-fs' 'python>=3.8')
makedepends=('python-setuptools')
optdepends=('python-fontpens' 'python-lxml')
license=('MIT')
arch=('any')
source=("https://pypi.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.zip")
sha256sums=('1967eaa23dcc8e1cbe3bd130aae4d9ddb72027b62d3e23eeb640065cfbd6d8d1')

check() {
    cd "$_pkgname-$pkgver"
    python setup.py test
}

package() {
    cd "${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
    install -D -m644 License.txt "${pkgdir}/usr/share/licenses/${pkgname}/License.txt"
}
