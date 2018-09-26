# Maintainer: Jonathan Liu <net147@gmail.com>
pkgname=shadergen
_realpkgname=ShaderGen
pkgver=3.5.0
pkgrel=1
pkgdesc="Automatically generates OpenGL Shading Language shaders that duplicate fixed function OpenGL behavior"
arch=('i686' 'x86_64')
url="https://github.com/mojocorp/ShaderGen"
license=('BSD')
depends=('qt5-base')
source=("https://github.com/mojocorp/${_realpkgname}/archive/${pkgver}.tar.gz")
md5sums=('d260b8f10f46ad3da41d544388349996')

prepare() {
  cd "${_realpkgname}-${pkgver}"
  qmake
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
