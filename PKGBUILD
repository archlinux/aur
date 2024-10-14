# Maintainer: izzqz <v@izzqz.me>
# Contributor: Brian Bidulock <bidulock@openss7.org>
# Contributor: Robert Wiklund <robert@wikro.org>
# Contributor: carstene1ns <arch carsten-teibes de>

pkgname=libpthread-stubs
pkgver=0.5
pkgrel=1
pkgdesc="This library provides weak aliases for pthread functions not provided in libc or otherwise available by default."
arch=('any')
url="https://gitlab.freedesktop.org/xorg/lib/pthread-stubs"
license=('MIT')
source=("http://xcb.freedesktop.org/dist/${pkgname}-${pkgver}.tar.gz")
sha256sums=('593196cc746173d1e25cb54a93a87fd749952df68699aab7e02c085530e87747')

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}/" install
}

# vim:set ts=2 sw=2 et:
