# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=python-parallax
_pkgname=parallax
pkgver=1.0.8
pkgrel=1
pkgdesc="Execute commands and copy files over SSH to multiple machines at once"
arch=('any')
license=('BSD')
url="https://github.com/krig/parallax"
makedepends=('python-setuptools' 'python-setuptools' 'python-build' 'python-installer')
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('071f4413a0d49838af19359f10dca161aabbbece81175ddae72a51618321f046')



build() {
  cd "$_pkgname"-"$pkgver"
  python -m build --wheel --no-isolation
}
package() {
  cd "$srcdir/$_pkgname"-"$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
