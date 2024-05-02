# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=scu-bin
pkgver=1.4.0
pkgrel=3
_build=6560963780
pkgdesc="System fetch utility is aimed at informativeness"
arch=(x86_64)
url="https://gitlab.com/omnitix/${pkgname%-bin}"
license=(GPL-3.0-or-later)
depends=(
  gcc-libs
  glibc
)
provides=(${pkgname%-bin})
conflicts=(${pkgname%-bin})
options=(!debug)
source=($url/-/jobs/$_build/artifacts/raw/scu{,.md5sum})
b2sums=(
  '43b3ec558bf6b853aba3363aa978bd4e2e48706994f8e91a0ea143680954b97a71171e050ad665e7538af69314cd6887c787abe674783b651add2084f67ea6c9'
  'SKIP'
)

prepare() {
  md5sum -c ${pkgname%-bin}.md5sum
}

package() {
  install -vDm755 ${pkgname%-bin} -t "$pkgdir"/usr/bin/
}
