pkgname=python2-regex
pkgver=2020.11.13
pkgrel=1
pkgdesc="Alternative regular expression module, to replace re."
url="https://bitbucket.org/mrabarnett/mrab-regex"
depends=('python2')
makedepends=('python2-setuptools')
license=('Python' 'Apache')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/r/regex/regex-${pkgver}.tar.gz")
sha256sums=('83d6b356e116ca119db8e7c6fc2983289d87b27b3fac238cfe5dca529d884562')

build() {
    cd "${srcdir}/regex-${pkgver}"

    python2 setup.py build
}

package() {
    cd "${srcdir}/regex-${pkgver}"

    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -Dm644 LICENSE.txt "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE.txt
}
