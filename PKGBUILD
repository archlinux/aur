# Maintainer:	Batuhan Baserdem <lastname dot firstname at gmail>
#
name='wrapio'
pkgname="python-${name}"
provides=("${pkgname}")
conflicts=()
pkgver=0.3.8
pkgrel=1
pkgdesc='Handling event-based streams.'
arch=('x86_64')
url="https://github.com/Exahilosys/${name}"
license=('MIT')
source=("${url}/archive/v${pkgver}.tar.gz")
makedepends=('python-setuptools')
depends=('python>=3.5')
md5sums=('170de19707eaa0596db01b0edac405d0')

build() {
    cd "${srcdir}/${name}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${name}-${pkgver}"
    # Run python setup function
    python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
    # Install the licence
    install -Dm644 "${srcdir}/${name}-${pkgver}/LICENCE" \
    	"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
