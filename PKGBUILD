# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=scu-bin
pkgver=1.6.1
pkgrel=0
_build=6560963780
pkgdesc="System fetch utility is aimed at informativeness"
arch=(x86_64)
url="https://gitlab.com/omnid/scu"
license=(GPL-3.0-or-later)
depends=(
  gcc-libs
  glibc
)
provides=(${pkgname%-bin})
conflicts=(${pkgname%-bin})
options=(!debug)
source=(https://github.com/srtnnm/scu/releases/download/1.6.1/scu{,.md5sum})
b2sums=(
  '6d14f133122f1e77b6dabdd4bbfc0b02b8a940a0bcddc6d178dc23560f7594e6a4518d78ddf07920856756c4c71a7e39e4d9103616b1a9f02774178647b0decd'
  'SKIP'
)

prepare() {
  md5sum -c ${pkgname%-bin}.md5sum
}

package() {
  install -vDm755 ${pkgname%-bin} -t "$pkgdir"/usr/bin/
}
