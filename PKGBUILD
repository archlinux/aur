# Maintainer: killab33z <killab33z @ hispagatos-dot-org>
# Previous Maintainer: fordprefect <fordprefect @ dukun-dot-de>
pkgname=python-gpapi
_name=${pkgname#python-}
pkgver=0.4.4
pkgrel=2
pkgdesc="Google Play Unofficial Python API "
arch=('any')
url="https://github.com/NoMore201/googleplay-api"
license=('GPL-3.0-or-later')
depends=("python" "python-cryptography" "python-protobuf" "python-requests")
makedepends=("python-setuptools")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('1b08989e503d35c023b164adacc42d98a3bf2f5c6b030b35a0fbcf112dd45407f3a43e374f9503e7d838dd8345701a652d047ab5c2efc5fbf2dd728f4b1cfa8b')
 
# https://wiki.archlinux.org/title/Python_package_guidelines
build() {
  cd googleplay-api-$pkgver
  python setup.py build
}

package() {
  cd googleplay-api-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}
