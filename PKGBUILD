# Maintainer: Julien Taverna <jujudusud -at- gmail -dot- com>

pkgname="python-aggdraw"
_pkgname="aggdraw"
pkgdesc="Module to implements the basic WCK 2D Drawing Interface on top of the AGG library."
pkgver=1.3.15
pkgrel=1
arch=('x86_64')
url="https://github.com/pytroll/aggdraw"
license=('MIT')
depends=('python' 'freetype2')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/63/90/8cabdc73526cd8628ddb124e2e55f77dc3324bdddccc3dd14d070076bb19/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('9aba19855e6b23c36e18a9462ad319ad11a7c222d33341ae21a5669840e5018d')


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
