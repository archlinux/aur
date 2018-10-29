# Maintainer: Jean-Gabriel Young <info@jgyoung.ca>

pkgname=python-eon
pkgver=1.0
pkgrel=1
pkgdesc="Source code accompanying 'Mathematics of Epidemics on Networks' by Kiss, Miller, and Simon"
arch=('i686' 'x86_64')
url='https://epidemicsonnetworks.readthedocs.io/en/latest/'
license=(MIT)
depends=(python-networkx)
provides=(python-eon)
_name=${pkgname#python-}
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/EoN-${pkgver}.tar.gz")
sha256sums=('25d9f6389afbb400ff1fa719249937d23576e6005cd3f6b2fd42b7abdc41a1c8')
build() {
    cd EoN-${pkgver}
    python setup.py build
}

package() {
    cd EoN-${pkgver}
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
