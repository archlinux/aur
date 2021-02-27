# Maintainer: Julien Taverna <jujudusud -at- gmail -dot- com>

pkgname="python-aggdraw"
_pkgname="aggdraw"
pkgdesc="Module to implements the basic WCK 2D Drawing Interface on top of the AGG library."
pkgver=1.3.12
pkgrel=1
arch=('x86_64')
url="https://github.com/pytroll/aggdraw"
license=('MIT')
depends=('python' 'freetype2')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/c0/fe/ecb4d498145c825c5df565afb9fb3a52ff329599127d904d2bab6104506a/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('129cbd59544bf208d2a3c62ff084bcf6c32d22d576a039186d954f8d201920a5')


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