# Maintainer: Simon Désaulniers <rostydela@gmail.com>
pkgname='dpaste'
pkgver=20161119
pkgrel=1
pkgdesc="A simple pastebin for light values (max 64KB) using OpenDHT distributed hash table."
arch=('i686' 'x86_64')
license=('GPL3')
url='https://github.com/sim590/dpaste'
source=('git://github.com/sim590/dpaste')
makedepends=('opendht-git')
makedepends_x86_64=('gnutls')
makedepends_i686=('lib32-gnutls')
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/dpaste"
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

build() {
  cd "${srcdir}/dpaste"
  make
}

package() {
  cd "${srcdir}/dpaste"
  install -Dpv dpaste ${pkgdir}/usr/bin/dpaste
}
# vim: ts=2 sw=2 et:
