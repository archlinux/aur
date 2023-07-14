# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Evan McCarthy <evan@mccarthy.mn>
# Contributor: neko <hi@neko.vg>

pkgname=pounce
pkgver=3.1
pkgrel=1
pkgdesc='A multi-client, TLS-only IRC bouncer'
arch=('x86_64')
url='https://git.causal.agency/pounce'
license=('GPL3')
depends=('libretls' 'libxcrypt')
makedepends=('git')
_commit='d312bbc4a659c4231d6731216aa9f34ad1d77dda'
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
