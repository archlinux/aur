# Maintainer:	Batuhan Baserdem <lastname dot firstname at gmail>

name='survey'
pkgname="python-${name}"
provides=("${pkgname}")
pkgver=3.4.1
pkgrel=1
pkgdesc='A simple library for creating beautiful interactive prompts.'
arch=('x86_64')
url="https://github.com/Exahilosys/${name}"
license=('MIT')
source=("${url}/archive/v${pkgver}.tar.gz")
makedepends=('python-setuptools')
depends=(
    'python>=3.5'
    'python-wrapio>=0.3.5')
md5sums=('9e1fd33c111098b07744cd531d955a41')

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
