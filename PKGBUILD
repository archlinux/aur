# Maintainer: Popolon <popolon@popolon.org>

pkgname=loveshaderconverter
_pkgname=LoveShaderConverter
pkgver=0.1
pkgrel=1
pkgdesc="Converts the GLSL used in the Shader Toy to a version of GLSL that can be used by LÖVE, with custom calls for lua"
arch=($CARCH)
url='https://github.com/tsteinholz/LoveShaderConverter'
license=('MIT')
depends=()
makedepends=('cmake')
source=("https://github.com/tsteinholz/LoveShaderConverter/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('36b9930869654fd7883bd22067a00697424342b092f74deb920043fb5d1caf9f')

prepare() {
    cd "${srcdir}/"
    cmake -S ${_pkgname}-${pkgver} -B build \
      -DCMAKE_INSTALL_PREFIX="/usr" \
      -DCMAKE_POLICY_VERSION_MINIMUM=3.5
}

build() {
  cd "${srcdir}/"
  make -C build
}

package() {
  cd "${srcdir}/build"
  install -Dm755 LoveShaderConverter "${pkgdir}/usr/bin/LoveShaderConverter"
}
