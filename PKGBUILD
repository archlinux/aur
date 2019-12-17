# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=('python-defcon')
_pkgname='defcon'
pkgver='0.6.0'
pkgrel=1
pkgdesc='A set of UFO based objects for use in font editing applications.'
url="https://pypi.org/project/defcon/"
checkdepends=('python-pytest')
depends=('python' 'python-fonttools' 'python>=3.8')
makedepends=('python-setuptools')
optdepends=()
license=('MIT')
arch=('any')
source=("https://pypi.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.zip")
sha256sums=('52e461961b4b68ae6883f8a14a0d82f2d09f2de7a526b95c7d1b195c10ca745f')

check() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py test
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
    install -D -m644 License.txt "${pkgdir}/usr/share/licenses/${pkgname}/License.txt"
}
