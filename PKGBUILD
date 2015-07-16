# Maintainer: Celestial Walrus <aur@celestial.cf>

pkgname=wave-git
_pkgname=wave
pkgver=r35.932cbd5
pkgrel=1
pkgdesc='A simple command that outputs a sampled sine wave to stdout. Can be used to play music.'
arch=(i686 x86_64)
url='https://github.com/efferifick/wave'
license=(none)
depends=(glibc)
makedepends=(git)
source=(git://github.com/efferifick/wave)
sha1sums=('SKIP')

pkgver() {
  cd $_pkgname
  echo r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd $_pkgname
  make
}

package() {
  cd $_pkgname
  install -Dm755 "src/wave" "$pkgdir/usr/bin/wave"
}
