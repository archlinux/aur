# Maintainer: Emeric Grange <emeric.grange@gmail.com>

pkgname=minivideoinfos-git
pkgver=0.10
pkgrel=4
pkgdesc="Get detailed informations about your audio, video and picture files!"
url="https://github.com/emericg/MiniVideoInfos"
arch=("x86_64" "i686")
license=("GPL3")
depends=("qt6-base" "qt6-declarative" "qt6-charts" "qt6-svg" "qt6-location" "minivideo-git" "libexif" "taglib")
makedepends=("qt6-tools")

source=("${pkgname}::git+https://github.com/emericg/MiniVideoInfos.git")
sha256sums=('SKIP')

build() {
  cd "${pkgname}"
  qmake6 -config release PREFIX=${pkgdir}/usr/
  make
}

package() {
  cd "${pkgname}"
  make DESTDIR="${pkgdir}" install
}
