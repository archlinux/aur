# Maintainer: Jean-Gabriel Young <info@jgyoung.ca>

pkgname=python-netwulf
pkgver=0.0.6
pkgrel=1
pkgdesc="Interactive visualization of networks based on Ulf Aslak's d3 web app."
arch=('i686' 'x86_64')
url='https://github.com/benmaier/netwulf'
license=(MIT)
depends=(python-networkx)
_name=${pkgname#python-}
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('23937aeb0fe69308f521f67a48b7a7caa661a8118689df30642e09bb28b7d423')
build() {
    cd ${_name}-${pkgver}
    python setup.py build
}

package() {
    cd ${_name}-${pkgver}
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
