# Maintainer: Tim Schumacher <timschumi@gmx.de>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgname=python-googletrans
pkgver=4.0.0
pkgrel=1
pkgdesc="Free Google Translate API for Python."
arch=('any')
license=('MIT')
url="https://github.com/ShivangKakkar/googletrans"
depends=('python-httpx' 'python-h2')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("https://pypi.io/packages/source/g/googletrans-py/googletrans-py-$pkgver.tar.gz")
sha512sums=('49bc20e6685ab6d877dedad10c44752ae18fcce3d1e9016667cf696ec70d2335bee9ad349395d8cb2039353c2f48c098cd3b643b39622a663de4dd5bea025a4d')

build() {
  cd "googletrans-py-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "googletrans-py-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
