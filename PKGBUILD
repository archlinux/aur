# Maintainer: Clément Démoulins <clement@archivel.fr>

pkgname=pamixer-git
_realname=pamixer
pkgver=20191030
pkgrel=2
pkgdesc="Pulseaudio command-line mixer like amixer"
arch=('i686' 'x86_64')
url="https://github.com/cdemoulins/pamixer"
license=('GPL3')
depends=('libpulse' 'boost-libs')
makedepends=('git' 'boost')
conflicts=('pamixer')

source=(git+https://github.com/cdemoulins/pamixer.git)
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${_realname}"
  git log -1 --format="%cd" --date=short | tr -d '-'
}

build() {
  cd "$srcdir/${_realname}"
  make
}

package() {
  cd "$srcdir/${_realname}"
  install -D -m755 pamixer $pkgdir/usr/bin/pamixer
}

# vim:set ts=2 sw=2 et:
