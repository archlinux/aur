# Maintainer : Kazumi M. <kuroclef@gmail.com>

pkgname=angolmois-git
pkgver=latest
pkgrel=1
pkgdesc='A BM98-like rhythm game which supports the so-called BMS format for playing.'
arch=(i686 x86_64)
url=http://mearie.org/projects/angolmois/
license=(GPL2)
depends=(sdl2 sdl2_image sdl2_mixer smpeg2)
makedepends=(git)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git://github.com/lifthrasiir/angolmois.git)
md5sums=(SKIP)

pkgver() {
  cd "${pkgname%-git}"
  printf %s "$(date -I -ud "$(git log -1 --format=%ci)" | tr -d -)"
}

build() {
  cd "${pkgname%-git}"
  make
}

package() {
  cd "${pkgname%-git}"
  install -Dm 755 "${pkgname%-git}" "$pkgdir"/usr/bin/"${pkgname%-git}"
  install -Dm 644 INTERNALS.md      "$pkgdir"/usr/share/doc/"${pkgname%-git}"/INTERNALS.md
  install -Dm 644 README.md         "$pkgdir"/usr/share/doc/"${pkgname%-git}"/README.md
}
