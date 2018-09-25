# Maintainer: gkmcd <g@dramati.cc>

pkgname=('python-pyscaffold')
pkgver=3.1
pkgrel=3
pkgdesc="Python project template generator with batteries included"
url="https://pyscaffold.org/"
arch=('any')
license=('MIT')
depends=('python' 'python-setuptools-scm')
optdepends=('python-django: scaffold django projects'
            'python-cookiecutter: create custom scaffold templates')
# makedepends=('python-setuptools-scm' 'python-pbr' 'python-wheel')
makedepends=('git' 'python-wheel')
source=("pyscaffold-${pkgver}::git+https://github.com/blue-yonder/pyscaffold.git#tag=v${pkgver}")
md5sums=('SKIP')

build() {
  cd "${srcdir}"/pyscaffold-$pkgver
  python setup.py build
}

package_python-pyscaffold() {
  cd "${srcdir}/pyscaffold-$pkgver"
  python setup.py install --root=${pkgdir}
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
