# Maintainer: blacktemplar (blacktemplar@a1.net)
pkgname=vyper-git
_pkgname=vyper
pkgver=v0.2.11
pkgrel=1
pkgdesc="Pythonic Smart Contract Language for the EVM"
arch=('any')
url="https://github.com/ethereum/vyper"
license=('MIT')
depends=('python' 'python-pycryptodome' 'python-setuptools')
conflicts=('vyper')
provides=('vyper')
makedepends=('python-setuptools')
source=("git+https://github.com/ethereum/$_pkgname.git")
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git tag --sort=version:refname | tail -n1 | sed 's/\([^-]*-g\)/r\1/;s/-/_/g'
}

package(){
  cd "$srcdir/$_pkgname"
  python setup.py install --root="$pkgdir/" --optimize=1
}
