# Maintainer: Boyan <boyan@confest.im>
pkgname=eunomia-bin
pkgver=1.0.3
pkgrel=1
pkgdesc="FOL proof checker"
arch=('x86_64')
url="https://github.com/Girjoaba/Eunomia"
license=('MIT')
depends=(
  'git'
  'java-environment=17'
)
provides=('eunomia')
conflicts=('eunomia')

source_x86_64=("https://github.com/Girjoaba/Eunomia/releases/download/v${pkgver}/Eunomia-${pkgver}.jar")
sha256sums_x86_64=('1ca98a27b28b9a9dbac0f7520bee4ca4c4eb0802b33018fb2cd67bde7cc91896')

package() {
  _output="${srcdir}/Eunomia-${pkgver}.jar"
  sed -i '1s/^/#!\/usr\/bin\/java \-jar \n/' "${_output}"
  install -Dm755 "${_output}" "${pkgdir}/usr/bin/${pkgname/-bin/}"
}
