# Contributor: pappy <pa314159@users.noreply.github.com>
pkgbase=python-sarge
pkgname=('python-sarge')
pkgver=0.1.8
pkgrel=1
pkgdesc="The sarge package provides a wrapper for subprocess which provides command pipeline functionality."
arch=('any')
url="https://github.com/vsajip/sarge"
license=('BSD')
source=("git+https://github.com/vsajip/sarge.git#tag=${pkgver}")
sha256sums=('436e54c8803991e741585ed50ef35c4c778f1d065e7dab63cc8838f28f4eed07')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'git')
conflicts=('python-sarge-git')

package() {
  cd "${srcdir}/sarge"
  python -m build --wheel --no-isolation
  python -m installer --destdir="$pkgdir" dist/*.whl
}
