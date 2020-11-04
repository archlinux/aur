# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=inquirer
pkgname="python-${_pkgname}"
pkgver=2.7.0
pkgrel=2
pkgdesc="Collection of common interactive command line user interfaces, based on Inquirer.js"
arch=('any')
url="https://pypi.org/project/${_pkgname}"
license=('MIT')
depends=('python' 'python-blessed' 'python-readchar' 'python-editor')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/magmax/python-inquirer/archive/${pkgver}.tar.gz")
sha256sums=('0ed6c9ee4a6eab6d914dfe08903430066a2222234ca0146760471270d93f0992')
b2sums=('e3628c395fd4df1570df5d3e397d4237a957501b9712fd2c031ea1be966450d16fa748c4655244d2230ec95497c0f3c50714217be294e7f7a2bf51d853e30d98')

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
