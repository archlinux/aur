# Maintainer: Noel <cutie@floofy.dev>

pkgname=utt-bin
pkgver=0.0.6
pkgrel=3
pkgdesc="utt is the universal text transformer"
license=('MIT')
arch=('x86_64')
depends=('java-environment')
makedepends=('git' 'maven' 'java-environment=11')
url='https://github.com/queer/utt'
sha256sums=('746ba41a80ff0017c104eba91160b05e25bd3cdb887b238a7e63289154123b7c'
            '1abf3a062636906baaf58b10925622cf36d8a190134bdca41b99454690194063')
source=("utt.sh"
        "utt.tar.gz::https://github.com/queer/utt/archive/refs/tags/${pkgver}.tar.gz")

build() {
  mvn clean package -f "${srcdir}/utt-${pkgver}/pom.xml"
}

package() {
  install -Dm0755 "${srcdir}/utt-${pkgver}/target/utt-${pkgver}.jar" "${pkgdir}/usr/share/utt/utt.jar"
  install -Dm0755 utt.sh "${pkgdir}/usr/bin/utt"
  chmod +x "${pkgdir}/usr/bin/utt"
}
