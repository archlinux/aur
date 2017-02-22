# Maintainer: Jonathan Liu <net147@gmail.com>
pkgname=shadergen
_realpkgname=ShaderGen
pkgver=3.3.1
pkgrel=1
pkgdesc="Automatically generates OpenGL Shading Language shaders that duplicate fixed function OpenGL behavior"
arch=('i686' 'x86_64')
url="https://github.com/mojocorp/ShaderGen"
license=('BSD')
depends=('glew' 'qt4')
source=("https://github.com/mojocorp/${_realpkgname}/archive/v${pkgver}.tar.gz")
md5sums=('07528cd57b6f1e3efbc8788042361ef8')

prepare() {
  cd "${_realpkgname}-${pkgver}"
  qmake-qt4
}

build() {
  cd "${_realpkgname}-${pkgver}"
  make
}

package() {
  cd "${_realpkgname}-${pkgver}"
  install -D -m 755 License.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m 755 build/ShaderGen "${pkgdir}/usr/bin/ShaderGen"
}

# vim:set ts=2 sw=2 et:
