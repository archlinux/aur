# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

_pkgname=redpanda-cpp

pkgname=redpanda-cpp-bin
pkgver=2.20
pkgrel=1
pkgdesc="A light-weight C/C++ IDE based on Qt"
arch=('x86_64')
url="https://github.com/royqh1979/RedPanda-CPP"
license=('GPL')
options=('!strip')
depends=('qt5-base' 'qt5-svg')
optdepends=('gcc' 'gdb' 'git' 'make' 'qterminal' 'raylib' 'raylib-drawing')
provides=('redpanda-cpp')
conflicts=('redpanda-cpp')
source=(
  "${url}/releases/download/${pkgver}/${_pkgname}_${pkgver}-1_amd64.debian11.deb"
)
sha256sums=(
'SKIP'	
#  'b4f32ecc2dbd7c627ead6f385fdb2dba8d43a71fea17e2d102cd9d47295eb3cd'
)
noextract=(
  "${_pkgname}_${pkgver}-1_debian11_amd64.deb"
)

package() {
  bsdtar -O -xf "${_pkgname}_${pkgver}-1_debian11_amd64.deb" data.tar.xz | bsdtar -C "${pkgdir}" -xJf -
}
