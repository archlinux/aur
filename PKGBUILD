# Maintainer: edoz90

pkgname=t50
_major=5
_minor=7
_rev=1
pkgver=${_major}.${_minor}.${_rev}
pkgrel=1
pkgdesc="T50 (f.k.a. F22 Raptor) is a tool designed to perform 'Stress Testing'"
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
url="https://github.com/fredericopissarra/t50"
license=('GPLv2')
provides=("t50")

source=("${pkgname}.tar.gz::https://github.com/fredericopissarra/t50/archive/v${pkgver}.tar.gz")
md5sums=('f93a16d015c003e1aed3ab13555f0b9a')

build() {
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr --mandir=/usr/share/man
  make sbindir=/usr/bin
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir/" sbindir=/usr/bin install
}

# vim:set et sw=2 sts=2 tw=80:
