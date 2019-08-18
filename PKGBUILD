# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=('python-compreffor')
_pkgname='compreffor'
pkgver='0.4.6.post1'
pkgrel=1
pkgdesc="A CFF table suroutinizer for FontTools."
url="https://github.com/googlefonts/compreffor"
checkdepends=()
depends=('python' 'python-fonttools')
makedepends=('cython' 'python-setuptools')
optdepends=()
license=('Apache')
arch=('x86_64')
source=("https://pypi.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.zip")
sha256sums=('6e3027d0247f3c52dbda7bce1143c9e2c7aa4a496c8e0d76d7dc424bfc9a6749')

check() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py test
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}
