# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=redpanda-cpp-bin
pkgver=1.0.6
pkgrel=1
pkgdesc="A light-weight C/C++ IDE based on Qt"
arch=('x86_64')
url="https://github.com/royqh1979/RedPanda-CPP"
license=('GPL')
options=('!strip')
depends=('qt5-base' 'qt5-svg')
optdepends=('gcc' 'gdb' 'make' 'qterminal')
provides=('redpanda-cpp')
conflicts=('redpanda-cpp')
source=(
  "${url}/releases/download/${pkgver}/redpanda-cpp-debian_${pkgver}-1_amd64.deb"
)
sha256sums=(
  'b178d10b39536eb0ea839724257e6cae94c0f95d425b19a630a157c049817bce'
)
noextract=(
  "redpanda-cpp-debian_${pkgver}-1_amd64.deb"
)

package() {
  bsdtar -O -xf "redpanda-cpp-debian_${pkgver}-1_amd64.deb" data.tar.xz | bsdtar -C "${pkgdir}" -xJf -
}
