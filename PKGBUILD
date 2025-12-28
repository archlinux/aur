# Maintainer: Notify-ctrl <notify-ctrl@qq.com>

pkgname=freekill
_upper_pkgname=FreeKill
pkgver=0.5.18
pkgrel=1
arch=('x86_64')
url='https://github.com/Notify-ctrl/FreeKill'
license=('GPL3')
pkgdesc='A Bang-like card game'
depends=('qt6-declarative' 'qt6-multimedia' 'qt6-5compat'
  'qt6-shadertools' 'libgit2' 'lua' 'sqlite' 'openssl'
  'readline' )
makedepends=('cmake' 'qt6-tools' 'swig' 'clang')
source=("${url}/releases/download/v${pkgver}/FreeKill-${pkgver}-source.tar.gz")
sha256sums=('1f938dc2131586303860443ed0804c91b4f069b7bf45fb4f77c87c0e6954dc08')

prepare() {
  cd ${srcdir}/${_upper_pkgname}-${pkgver}
  rm -rf build
}

build() {
  cd ${srcdir}/${_upper_pkgname}-${pkgver}
  mkdir build && cd build
  cmake .. -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd ${srcdir}/${_upper_pkgname}-${pkgver}
  cmake --install build --prefix ${pkgdir} --config Release
}
