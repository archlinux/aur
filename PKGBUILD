# Maintainer: Maikel Wever <maikelwever@gmail.com>
pkgname=safety
pkgver=1.9.0
pkgrel=1
pkgdesc="Safety checks your installed dependencies for known security vulnerabilities."
url="https://github.com/pyupio/safety"
license=('MIT')
depends=('python' 'python-click' 'python-requests' 'python-packaging' 'python-dparse')
makedepends=('python-setuptools')
source=("https://github.com/pyupio/safety/archive/${pkgver}.tar.gz")
md5sums=('c4527081b3c0004271ecbf3726eb6185')
arch=('any')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
  cp LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt
}

# vim:set ts=2 sw=2 et:
