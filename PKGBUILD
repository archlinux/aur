# Maintainer: Bruce Zhang
pkgname=spirv-headers-git
pkgver=r128.4618b86
pkgrel=1
pkgdesc='SPIR-V header files Git version'
arch=('any')
url='https://www.khronos.org/registry/spir-v/'
license=('custom')
source=('git://github.com/KhronosGroup/SPIRV-Headers.git')
sha1sums=('SKIP')
conflicts=('spirv-headers')
provides=('spirv-headers')

pkgver() {
    cd "${srcdir}/SPIRV-Headers"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/SPIRV-Headers/include/spirv/unified1"

  mkdir -p "${pkgdir}"/usr/include/spirv/unified1/
  install -m644 spirv.h        "${pkgdir}"/usr/include/spirv/unified1/
  install -m644 spirv.hpp      "${pkgdir}"/usr/include/spirv/unified1/
  install -m644 spirv.hpp11    "${pkgdir}"/usr/include/spirv/unified1/
  install -m644 GLSL.std.450.h "${pkgdir}"/usr/include/spirv/unified1/
  install -m644 OpenCL.std.h   "${pkgdir}"/usr/include/spirv/unified1/
}
