# Maintainer: Jakob Englisch <jakob.englisch[at]gmail[dot]com>

pkgname=tower-cli
pkgver=3.3.0
pkgrel=1
pkgdesc="Command line tool and client library for the Ansible Tower and AWX Project's REST API."
arch=('any')
url="https://github.com/ansible/tower-cli"
license=('Apache')
depends=('python2')
makedepends=("python2-setuptools")
options=(!emptydirs)
source=("https://github.com/ansible/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('7dcd730b27b878a4a747a9190550c468a8791f8b3cf2cb7f5bc90bec6bebff80')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  python2 setup.py build
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
