# Maintainer: Julien Taverna <jujudusud -at- gmail -dot- com>

pkgname="python-aggdraw"
_pkgname="aggdraw"
pkgdesc="Module to implements the basic WCK 2D Drawing Interface on top of the AGG library."
pkgver=1.3.19
pkgrel=1
arch=('x86_64')
url="https://github.com/pytroll/aggdraw"
license=('MIT')
depends=('python' 'freetype2')
makedepends=('python-setuptools')
source=("https://github.com/pytroll/aggdraw/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('93e7e2fcd00b8c23a93c22f78e2d89b75f731284dd7e513b29218ac624fd163e')


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
