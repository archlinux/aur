pkgname=('python-superscs')
_pkgname='scs'
pkgver='1.3.2'
pkgrel=1
pkgdesc="Convex cone solver via operator splitting (based on SCS)."
url="https://kul-forbes.github.io/scs/"
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('x86_64')
source=("https://github.com/kul-forbes/scs/archive/v$pkgver.tar.gz"
    "LICENSE.txt")
sha256sums=('478c0088ca86807738b493275c22a7eb6f3ba21d11d5dd9d563a6d55c2a650e5'
            '08f771ceb0ecb7222247379ba8d2f415cbdaa34cefcb4fe46c010187c8e49e59')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"/python
    python setup.py build
}

package() {
    install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
    cd "${srcdir}/${_pkgname}-${pkgver}"/python
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
