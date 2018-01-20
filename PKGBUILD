# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=python-py-spin
pkgver=1.1.1
pkgrel=1
pkgdesc='Little terminal spinner lib'
arch=('any')
url=https://github.com/lord63/py-spin
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("py-spin-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('0282e0b26f965dbe91b93f68c2327021923539a8c6433aa9bdb6c6a614c687bd0de7927833a536174f6d77aeb1f60fa330f5de049798c50f38142859fc0265b0')

build() {
  cd py-spin-$pkgver
  python setup.py build
}

check() {
  cd py-spin-$pkgver
  pytest test_pyspin.py
}

package() {
  cd py-spin-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/py-spin/LICENSE
}

# vim:set ts=2 sw=2 et:
