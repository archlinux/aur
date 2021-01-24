# Maintainer: gee

pkgname=reshade-shaders-git
pkgver=r876.891aca4
pkgrel=1
pkgdesc='A collection of post-processing shaders written in the ReShade FX shader language, to be used by vkBasalt'
arch=('any')
url='https://github.com/crosire/reshade-shaders'
license=('custom')
makedepends=('git')
source=("git+https://github.com/crosire/reshade-shaders.git#branch=master")
sha256sums=(SKIP)

pkgver() {
  cd "reshade-shaders"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd ${srcdir}/reshade-shaders

  install -dm 755 "${pkgdir}/usr/share/reshade/shaders"
  install -Dm 644 Shaders/*.*  "${pkgdir}/usr/share/reshade/shaders/"
  install -dm 755 "${pkgdir}/usr/share/reshade/textures"
  install -Dm 644 Textures/*.* "${pkgdir}/usr/share/reshade/textures/"
}
