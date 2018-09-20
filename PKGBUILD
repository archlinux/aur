# Maintainer: gkmcd <g@dramati.cc>
pkgbase=python-pyscaffold
pkgname=('python-pyscaffold')
pkgver=3.1
pkgrel=1
pkgdesc="Python project template generator with batteries included"
url="https://pyscaffold.org/"
arch=(any)
license=('BSD')
depends=('python')
optdepends=('python-django: scaffold django projects'
            'python-cookiecutter: create custom scaffold templates')
makedepends=('python-setuptools-scm' 'python-pbr' 'python-wheel')
source=("pyscaffold-${pkgver}::git+https://github.com/blue-yonder/pyscaffold.git#tag=v${pkgver}")
md5sums=('SKIP')

build() {
  cp -r "${srcdir}"/pyscaffold-$pkgver

  cd "${srcdir}"/pyscaffold-$pkgver
  python setup.py build
}

package_python-pyscaffold() {
  depends=('python-pbr' 'python-wheel')

  cd "${srcdir}/pyscaffold-$pkgver"
  python setup.py install --root=${pkgdir}
  #rm -r ${pkgdir}/usr/share/pyscaffold/docs
}
