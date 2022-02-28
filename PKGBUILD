# Maintainer: gee

pkgname=reshade-shaders-git
pkgver=r879.a2314cb
pkgrel=1
pkgdesc='A collection of post-processing shaders written in the ReShade FX shader language, to be used by vkBasalt'
arch=('any')
url='https://github.com/crosire/reshade-shaders'
license=('custom')
makedepends=('git')
source=("git+https://github.com/crosire/reshade-shaders.git#branch=master")
sha256sums=(SKIP)
install=reshade-shaders.install

pkgver() {
  cd "reshade-shaders"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd ${srcdir}/reshade-shaders

  install -dm 755 "${pkgdir}/opt/reshade/shaders"
  install -Dm 644 Shaders/*.*  "${pkgdir}/opt/reshade/shaders/"
  install -dm 755 "${pkgdir}/opt/reshade/textures"
  install -Dm 644 Textures/*.* "${pkgdir}/opt/reshade/textures/"
}
