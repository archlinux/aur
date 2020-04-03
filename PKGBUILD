# Maintainer: Ricardo (XenGi) Band <email@ricardo.band>
pkgname=virtualfish
pkgver=1.0.6
pkgrel=10
pkgdesc="A virtualenv wrapper for the Fish shell"
arch=(any)
url="https://github.com/adambrenecki/virtualfish"
license=('MIT')
install=virtualfish.install
provides=('python-virtualfish')
makedepends=('python-setuptools' 'python-setuptools-scm>=1.11.1')
#checkdepends=('python-pytest>=3.1.3' 'python-pytest-xdist>=1.22.2')
depends=('python-virtualenv' 'python-pkgconfig>=1.2.2' 'python-psutil>=5.2.2' 'python-xdg' 'python-distlib')  # >=1.0.5')
source=("${pkgname}::git+https://github.com/adambrenecki/${pkgname}.git#tag=${pkgver}")
sha256sums=('SKIP')

#check() {
#    cd "${srcdir}/${pkgname}"
#    pytest .
#}

build() {
    cd "${srcdir}/${pkgname}"
    python setup.py build
}

package() {
    cd "${srcdir}/${pkgname}"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

