# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=redpanda-cpp-bin
pkgver=1.0.0
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
  "${url}/releases/download/${pkgver}/redpanda-cpp-ubuntu20.04_${pkgver}-1_amd64.deb"
)
sha256sums=(
  'cd07199c88fc4a311ea48a2b4ce9313a057db18a011345eef5eff646da1ba527'
)
noextract=(
  "redpanda-cpp-ubuntu20.04_${pkgver}-1_amd64.deb"
)

package() {
  bsdtar -O -xf "redpanda-cpp-ubuntu20.04_${pkgver}-1_amd64.deb" data.tar.xz | bsdtar -C "${pkgdir}" -xJf -
}
