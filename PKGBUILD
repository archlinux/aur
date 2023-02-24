# Maintainer: Julien Taverna <jujudusud -at- gmail -dot- com>

pkgname="python-aggdraw"
_pkgname="aggdraw"
pkgdesc="Module to implements the basic WCK 2D Drawing Interface on top of the AGG library."
pkgver=1.3.16
pkgrel=1
arch=('x86_64')
url="https://github.com/pytroll/aggdraw"
license=('MIT')
depends=('python' 'freetype2')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/82/d8/de1cdc81220ad42a537de65a6e6be6825a0f1f59c365dd8f6d95d749191f/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('8536d8a88d361dcb0297a1c059f263e650c6ede73164943ad3a1eb0c49a1573e')


build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir" --skip-build --optimize=1

  # license
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
