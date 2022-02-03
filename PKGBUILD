# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Evan McCarthy <evan@mccarthy.mn>
# Contributor: neko <hi@neko.vg>

pkgname=pounce
pkgver=3.0
pkgrel=1
pkgdesc='A multi-client, TLS-only IRC bouncer'
arch=('x86_64')
url="https://git.causal.agency/pounce"
license=('GPL3')
depends=('libretls' 'libxcrypt')
makedepends=('git')
_commit='1d217a2b9e733a825c3ce4b2dc5b5e5d2ada5d4b'
source=("git+https://git.causal.agency/pounce.git#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd pounce

  git describe --tags
}

prepare() {
  cd pounce

  ./configure \
    --prefix=/usr \
    --mandir=/usr/share/man
}
build() {
  cd pounce

  make all
}

package() {
  cd pounce

  make DESTDIR="$pkgdir" install
}
