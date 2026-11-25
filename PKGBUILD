# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=glsl-sandbox-bin
pkgver=0.1.41
pkgrel=1
pkgdesc="Shader editor and gallery server"
arch=('x86_64' 'aarch64')
url="https://github.com/mrdoob/glsl-sandbox"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/glsl-sandbox_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/glsl-sandbox_Linux_arm64.tar.gz")
sha256sums_x86_64=('ea2f1edc7b774490bf2232db3bb11a81edeebcf25dcd10f96d4035b39befff01')
sha256sums_aarch64=('7f9e7284d8403737a5fb6409dc46c902a30cc4c83410e471ceadc51be76710b3')

package() {
  install -Dm755 "glslsandbox" "${pkgdir}/usr/bin/glslsandbox"
  install -Dm755 "glsladmin" "${pkgdir}/usr/bin/glsladmin"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
