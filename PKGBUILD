# Maintainer: Serkan Hosca <serkan@hosca.com>

pkgname=devpi-web
pkgver=3.2.0
pkgrel=1
pkgdesc="devpi-web: web interface plugin for devpi-server"
arch=(any)
url="http://doc.devpi.net/"
license=('MIT')
depends=('python' 'devpi-server')
makedepends=('python-setuptools')
source=("https://pypi.io/packages/source/d/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('ca074d35d2f8079b718938773ac571e28123358f4d565d2c925e62d5a0d620f0')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set ts=2 sw=2 et:

