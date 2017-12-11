# Maintainer: DanManN <dnahimov@gmail.com>
pkgname=python-qiskit-api-git
pkgver=1.8.19.r0.g1133844
pkgrel=1
pkgdesc="A Python library for the Quantum Experience API."
arch=('any')
url="http://www.qiskit.org"
license=('Apache-2.0')
groups=('QISKit')
depends=('python')
makedepends=('git' 'python-setuptools')
provides=('python-qiskit-api')
conflicts=('python-qiskit-api')
source=("git+https://github.com/QISKit/qiskit-api-py.git")
md5sums=('SKIP')

pkgver() {
  cd qiskit-api-py
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd qiskit-api-py
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
