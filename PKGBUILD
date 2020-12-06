# Maintainer:	Kostas Kardaras <firstname dot lastname at gmail>

_pkgname='survey'
pkgname='python-survey'
provides=('python-survey')
conflicts=()
pkgver=2.2.1
pkgrel=1
pkgdesc='A simple library for creating beautiful interactive prompts.'
arch=('x86_64')
url="https://github.com/Exahilosys/${_pkgname}"
license=('MIT')
source=("${url}/archive/v${pkgver}.tar.gz")
makedepends=('python-setuptools')
depends=(
    'python>=3.5'
    'python-wrapio')
optdepends=()
md5sums=('7c42870b4f428de6b73948286ab30db7')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py build
}


package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    # Run python setup function
    python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
    # Install the licence
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/LICENCE" \
    	"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
