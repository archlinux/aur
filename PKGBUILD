# Maintainer: Noel <cutie@floofy.dev>

pkgname=utt-bin
pkgver=0.0.6
pkgrel=2
pkgdesc="utt is the universal text transformer"
license=('MIT')
arch=('x86_64')
depends=('java-environment')
makedepends=('git' 'maven' 'java-environment=11')
url='https://github.com/queer/utt'
sha256sums=('1c4dd97545b54883508765c54950d775732d7aa4474335f5fc4a28f607fb2459'
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
