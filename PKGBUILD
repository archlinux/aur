# Maintainer: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>

pkgname=devpi-semantic-ui
pkgver=0.2.2
pkgrel=1
pkgdesc="A Semantic UI theme for devpi"
arch=(any)
url="http://doc.devpi.net/"
license=('MIT')
depends=('python' 'devpi-server')
makedepends=('python-setuptools')
source=("https://pypi.io/packages/source/d/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('554b076d4f1e5c827765c1019cdacfeea7f43a8356ef94f3fdedc7233b3f1868')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set ts=2 sw=2 et:

