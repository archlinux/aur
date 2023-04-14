# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=tarjan
pkgname="python-${_pkgname}"
pkgver=0.2.4
pkgrel=1
pkgdesc="Python implementation of Tarjan’s algorithm"
arch=('any')
url="https://pypi.org/project/${_pkgname}"
license=('LGPLv3')
depends=('python')
makedepends=('python-setuptools')
source=("${_pkgname}-${pkgver}::https://pypi.python.org/packages/source/${_pkgname:0:1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('a9d7e93368c8c75d33b0849801f2687a59c91e0ae487b8ba7e97e431e841a514')
b2sums=('54a41ce026582cab2c8370f95eea110fa47418e2cbd09929a47f51844f89cda04c164da2c8fe89b92d3f55e707b4f08463e6d5308fdf15c6ed992bbc289665af')

build() {
  cd "${_pkgname}-${pkgver}"

  python setup.py build
}

check() {
  cd "${_pkgname}-${pkgver}"

  export PYTHONPATH="build/lib"
  python setup.py test
}

package() {
  cd "${_pkgname}-${pkgver}"

  python setup.py install --root="${pkgdir}" --optimize=1
}
