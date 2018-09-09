# Maintainer: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>

pkgname=devpi-client
pkgver=4.1.0
pkgrel=1
pkgdesc="devpi upload/install/... workflow commands for Python developers"
arch=(any)
url="http://doc.devpi.net/"
license=('MIT')
depends=('python' 'python-py' 'python-tox' 'python-pkginfo' 'check-manifest' 'devpi-common')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('d8a1a145dc79a2d63fb0fb0f79568ccf352d21a6b7f2c577d988bad4fb9eb238')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set ts=2 sw=2 et:
