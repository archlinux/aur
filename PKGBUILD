# Maintainer:	Kostas Kardaras <firstname dot lastname at gmail>

_pkgname='wrapio'
pkgname='python-wrapio'
provides=('python-wrapio')
conflicts=()
pkgver=0.3.8
pkgrel=1
pkgdesc='Handling event-based streams.'
arch=('x86_64')
url="https://github.com/Exahilosys/${_pkgname}"
license=('MIT')
source=("${url}/archive/v${pkgver}.tar.gz")
makedepends=('python-setuptools')
depends=(
    'python>=3.5')
optdepends=()
md5sums=('170de19707eaa0596db01b0edac405d0')

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
