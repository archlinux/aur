# Maintainer: SY Zhang <lastavengers at outlook dot com>
# Contributor: wallnuss <v dot churavy at gmail dot com>

pkgname=trayer-srg
pkgver=1.1.6
pkgrel=3
pkgdesc="A trayer fork with multi monitor support, cleaned up codebase and other fancy stuff."
arch=('i686' 'x86_64')
url="https://github.com/sargon/trayer-srg"
license=('MIT')
depends=('gtk2' 'libxmu')
conflicts=('trayer' 'trayer-srg-git')
replaces=('trayer' 'trayer-srg-git')
provides=('trayer-srg')
source=("https://github.com/sargon/${pkgname}/archive/trayer-${pkgver}.tar.gz")
md5sums=('0ef2041c963dccf414bb8ebb34d64cb6')

_srcdir=${pkgname}-trayer-${pkgver}

build() {
  cd ${_srcdir}
  make
}

package() {
  cd ${_srcdir}
  make PREFIX="${pkgdir}/usr" install

  install -D -m644 man/trayer.1 "${pkgdir}/usr/share/man/man1/trayer.1"
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
