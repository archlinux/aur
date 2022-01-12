# Contributor: Yoan Blanc <yoan@dosimple.ch>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: David Moore <davidm@sjsoft.com>
_base=simplejson
pkgname=python2-${_base}
pkgver=3.17.6
pkgrel=1
pkgdesc='Simple, fast, extensible JSON encoder/decoder for python2'
license=('MIT')
arch=('x86_64')
url="https://github.com/${_base}/${_base}"
depends=(python2)
makedepends=(python2-setuptools)
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('48b74388cd3a5cf0acf46a9aa050d628513d842297625f791c7ae07a7c9289afcb0be8d374f77af3bebd50f4c200844bc69f5b77a67220fee357cdfc0d913726')

build() {
  cd "${_base}-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${_base}-${pkgver}"
  python2 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
