# Maintainer: 
# Contributor: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: David Runge <dave@sleepmap.de>
_name=Yapsy
pkgname=python-yapsy
pkgver=1.12.2
pkgrel=9
pkgdesc="A simple plugin system for Python applications"
arch=('any')
url="http://yapsy.sourceforge.net"
license=('BSD-2-Clause')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
#checkdepends=('python-pytest')
source=("https://master.dl.sourceforge.net/project/yapsy/${_name}-$pkgver/${_name}-$pkgver.tar.gz")
sha256sums=('d8113d9f9c74eacf65b4663c9c037d278c9cb273b5eee5f0e1803baeedb23f8b')

build() {
  cd "${_name}-$pkgver"
  python -m build --wheel --no-isolation
}

#check() {
#  cd "${_name}-$pkgver"
#  pytest
#}

package() {
  cd "${_name}-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}
