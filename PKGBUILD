# Maintainer: q234 rty <q23456yuiop at gmail dot com>
# Contributor: IsaacShoebottom (Isaac Shoebottom) <ir.shoebottom@gmail.com>
pkgname=mpv-modernz
_gitname=ModernZ
pkgver=0.3.3
_tag=v${pkgver}
pkgrel=1
pkgdesc='A sleek and modern OSC for mpv designed to enhance functionality by adding more features, all while preserving the core standards of the main mpv OSC'
arch=(any)
url=https://github.com/Samillion/ModernZ
license=(LGPL-2.1-only)
optdepends=('mpv-thumbfast: For showing thumbnails on the fly')
makedepends=()
depends=(mpv)
conflicts=(mpv-uosc mpv-modernx mpv-modernz-git)
source=(
  $_gitname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz
)
sha256sums=('c8a0436adb94322917b947a0ea3b36b5ec270eeeee065574231219b316aa2570')

package() {
  cd $_gitname-$pkgver
  install -Dm 644 "modernz.lua" -t "${pkgdir}/etc/mpv/scripts/"
  install -Dm 644 "modernz.conf" -t "${pkgdir}/etc/mpv/script-opts/"
  install -Dm 644 "modernz-icons.ttf" -t "${pkgdir}/etc/mpv/fonts/"
  install -Dm 644 "extras/locale/modernz-locale.json" -t "${pkgdir}/etc/mpv/script-opts/"
}
