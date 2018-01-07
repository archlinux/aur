# $Id: PKGBUILD 276082 2017-12-26 02:22:10Z eschwartz $
# Maintainer:
# Contributor: nblock <nblock [/at\] archlinux DOT us>
# Contributor: Dino Krtanjek <krtanjekdino@gmail.com>

pkgname=python2-iniparse
pkgver=0.4
pkgrel=4
pkgdesc='Better INI parser library for Python'
arch=('any')
license=('MIT')
url='https://code.google.com/archive/p/iniparse/'
depends=('python2')
source=("https://pypi.python.org/packages/source/i/iniparse/iniparse-${pkgver}.tar.gz")
sha1sums=('2b2af8a19f3e5c212c27d7c524cd748fa0b38650')

build() {
  cd "${srcdir}/iniparse-${pkgver}"
  python2 ./setup.py build
}

package() {
  cd "${srcdir}/iniparse-${pkgver}"
  python2 ./setup.py install --root="${pkgdir}" --optimize=1
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
