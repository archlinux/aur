# Maintainer:
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Daniel Isenmann <daniel@archlinux.org>
# Contributor: Sergej Pupykin <sergej@aur.archlinux.org>
# Contributor: Douglas Soares de Andrade <dsandrade@gmail.com>

pkgname=python2-urwid
pkgver=2.1.1
pkgrel=1
pkgdesc='Curses-based user interface library'
url='http://excess.org/urwid/'
arch=('x86_64')
license=('LGPL')
depends=('python2' 'glibc')
makedepends=('glibc' 'python2-setuptools')
source=(https://github.com/urwid/urwid/archive/release-${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('06fc11e62083f0de2ae8525d278bd5ca7f06bcf10773e299812ab5f617f8bd50')
sha512sums=('6ab861c02edff37e31b1a5b138e71abf978f8ef9a54e0993b740ec62c0986ce1e25c2421a4a4b0d428a8cd64970496b23790074c911b6e4990b3d821a3bf2b4c')

build() {
  (cd urwid-release-${pkgver}
    python2 setup.py build
  )
}

check() {
  (cd urwid-release-${pkgver}
    python2 setup.py test
  )
}

package() {
  cd urwid-release-${pkgver}
  python2 setup.py install --prefix=/usr --root="${pkgdir}" -O1 --skip-build
  rm -r "${pkgdir}"/usr/lib/python*/site-packages/urwid/tests
}

# vim: ts=2 sw=2 et:
