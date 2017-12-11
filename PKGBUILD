# Maintainer: DanManN <dnahimov@gmail.com>
pkgname=python-qiskit-sdk-git
pkgver=0.3.8.r42.g1a80896
pkgrel=1
pkgdesc="Python software development kit for writing quantum computing experiments, programs, and applications."
arch=('any')
url="http://www.qiskit.org"
license=('Apache-2.0')
groups=('QISKit')
depends=('python' 'python-requests' 'python-networkx' 'python-ply'
'python-numpy' 'python-scipy' 'python-matplotlib' 'python-sphinx'
'python-sympy' 'python-qiskit-api')
makedepends=('git' 'python-setuptools')
provides=('python-qiskit-sdk')
conflicts=('python-qiskit-sdk')
source=("git+https://github.com/QISKit/qiskit-sdk-py.git")
md5sums=('SKIP')

pkgver() {
  cd qiskit-sdk-py
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd qiskit-sdk-py
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
