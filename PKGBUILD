# Maintainer: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>

pkgname=devpi-client
pkgver=5.0.0
pkgrel=1
pkgdesc="devpi upload/install/... workflow commands for Python developers"
arch=(any)
url="http://doc.devpi.net/"
license=('MIT')
depends=('python' 'python-py' 'python-tox' 'python-pkginfo' 'check-manifest' 'devpi-common')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('786c3472e95807e397b961f60f472e91c30373caecf132a946c51856581fd243')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set ts=2 sw=2 et:
