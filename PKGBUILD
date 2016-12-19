# Maintainer: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>

pkgname=devpi-common
pkgver=3.0.1
pkgrel=1
pkgdesc="utilities jointly used by devpi-server and devpi-client"
arch=(any)
url="http://doc.devpi.net/"
license=('MIT')
depends=('python' 'python-py' 'python-requests')
makedepends=('python-setuptools')
source=("https://pypi.io/packages/source/d/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('7288df8367ff84e28cc58e0094bfc62280f83f25c09cf7f735dda4327d3c6a50')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set ts=2 sw=2 et:
