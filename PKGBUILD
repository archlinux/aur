# Maintainer: Alec Mev <alec@mev.earth>

pkgname=mpv-plugin-excerpt-git
pkgver=r16.09c8a7a
pkgrel=1
pkgdesc='Excerpt creation from within mpv'
arch=('any')
url=https://gitlab.com/lvml/mpv-plugin-excerpt
license=('GPL2')
depends=(
  'ffmpeg'
  'mpv'
)
makedepends=('git')
source=("${pkgname}::git+https://gitlab.com/lvml/mpv-plugin-excerpt.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "`git rev-list --count HEAD`" "`git rev-parse --short HEAD`"
}

package() {
  cd "${pkgname}"
  install -Dm755 -t "${pkgdir}/usr/bin/" excerpt_copy
  install -Dm644 -t "${pkgdir}/usr/lib/mpv/" excerpt.lua
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}/" README.md
}
