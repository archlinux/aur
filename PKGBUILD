# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: cs-cam - me.at.camdaniel.com

_pkgname=PyBluez
pkgname=python2-pybluez
pkgver=0.23
pkgrel=1
pkgdesc="python2 wrapper for the BlueZ Bluetooth stack"
arch=('x86_64')
url="https://pybluez.github.io/"
license=('GPL')
depends=('python2' 'bluez-libs')
makedepends=('python2-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('c8f04d2e78951eaa9de486b4d49381704e8943d0a6e6e58f55fcd7b8582e90de')
b2sums=('6a234d5c41dc0bb9f08559431eafcf1d1fb1c881d2cb912cc048e2717bfe8a06f09aae045d2961c9ba5e087422cfc8249a1907368eb6dc45942175bcf97b1841')

build() {
    cd "${srcdir}"/${_pkgname}-${pkgver}

    python2 setup.py build
}

package_python2-pybluez() {
    cd "${srcdir}"/${_pkgname}-${pkgver}

    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
