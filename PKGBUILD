# Contributor: Yoan Blanc <yoan@dosimple.ch>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: David Moore <davidm@sjsoft.com>
_base=simplejson
pkgname=python2-${_base}
pkgver=3.19.2
pkgrel=1
pkgdesc="Simple, fast, extensible JSON encoder/decoder for python2"
license=('MIT')
arch=('any')
url="https://github.com/${_base}/${_base}"
depends=(python2)
makedepends=(python2-setuptools)
source=(${url}/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('836bbd37b340df982ceee87c0653f1c6f17b010f8054c09213ce95456ba86220')

build() {
  cd "${_base}-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${_base}-${pkgver}"
  python2 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
