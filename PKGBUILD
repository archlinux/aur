# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=inquirer
pkgname="python-${_pkgname}"
pkgver=2.8.0
pkgrel=1
pkgdesc="Collection of common interactive command line user interfaces, based on Inquirer.js"
arch=('any')
url="https://pypi.org/project/${_pkgname}"
license=('MIT')
depends=('python' 'python-blessed' 'python-readchar' 'python-editor')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/magmax/python-inquirer/archive/${pkgver}.tar.gz")
sha256sums=('11272d019970b054b09834d048792ce06ebff21d8a5b200d865d1e18bc8a88e7')
b2sums=('c30276d37ba84e339bdce7d6316d3b08c528f68ce40bef9295c5bd8272b55487f75d2e0fc69a11c4a451aa1a9f6794445bcaf9da251912c3f136de8d0b1b90b1')

build() {
  cd "python-inquirer-${pkgver}"

  python setup.py build
}

package() {
  cd "python-inquirer-${pkgver}"

  python setup.py install --root="${pkgdir}" --optimize=1
  rm -rf "${pkgdir}/usr/lib"/python*/"site-packages/tests"

  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
