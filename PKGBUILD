# Maintainer: pappy <pa314159@users.noreply.github.com>
pkgbase=python-sarge
pkgname=('python-sarge')
pkgver=0.1.7.post1
pkgrel=3
pkgdesc="The sarge package provides a wrapper for subprocess which provides command pipeline functionality."
arch=('any')
url="https://github.com/vsajip/sarge"
license=('BSD')
source=("git+https://github.com/vsajip/sarge.git#tag=${pkgver}")
sha256sums=('b882b7529c22ab95ee4c6bab40557529640a28841180b4cc1fdb59d67a982e1f')
depends=('python')
makedepends=('python-setuptools' 'git')
conflicts=('python-sarge-git')

package() {
  cd "${srcdir}/sarge"
  python setup.py build
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
