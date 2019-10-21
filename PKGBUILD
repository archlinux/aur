# Maintainer: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>

pkgname=devpi-common
pkgver=3.4.0
pkgrel=1
pkgdesc="utilities jointly used by devpi-server and devpi-client"
arch=(any)
url="http://doc.devpi.net/"
license=('MIT')
depends=('python' 'python-py' 'python-requests')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('10cbe52a5c94eafe619a8c65601ee7dec31085609dffb171062258676f12d4dd')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set ts=2 sw=2 et:
