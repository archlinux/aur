pkgname=zulu-25-jdk-fx
pkgver=25.36.205
pkgrel=2
_javaver=25
pkgdesc='Azul Zulu JDK 25 with JavaFX'
arch=('x86_64')
url='https://www.azul.com/downloads'
license=('custom')

depends=(
  'java-runtime-common'
  'java-environment-common'
)
provides=(
  "java-environment=$_javaver"
  "java-environment-openjdk=$_javaver"
  "java-runtime=$_javaver"
  "java-runtime-openjdk=$_javaver"
  "java-runtime-headless=$_javaver"
  "java-runtime-headless-openjdk=$_javaver"
  "java-openjfx=$_javaver"
)
install="${pkgname}.install"
options=('!strip')

_filename='zulu25.36.205-ca-fx-jdk25.0.4.1-linux_x64'
source=(
  "https://cdn.azul.com/zulu/bin/${_filename}.tar.gz"
)
sha256sums=('dc541c82220402985ef4f646246235a55920f4493d79670eddaf33fa45a5c73c')

package() {
    local install_dir="${pkgdir}/usr/lib/jvm/${pkgname}"

    install -d "${install_dir}"

    cp -a "${srcdir}"/${_filename}/. "${install_dir}/"
}
