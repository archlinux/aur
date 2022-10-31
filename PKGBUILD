# Maintainer: Martin Larralde <martin.larralde@ens-paris-saclay.fr>

pkgname=ontodev-robot
pkgver=1.9.1
pkgrel=1
pkgdesc="ROBOT is an OBO Tool"
url="http://robot.obolibrary.org/"
arch=("any")
license=("BSD3")
groups=()
makedepends=()
depends=("java-runtime")
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/ontodev/robot/releases/download/v${pkgver}/robot.jar")
noextract=("robot.jar")
sha256sums=('d98a66fa6b53864690b2638fec81a65aa1ca27b9ab91c30344b13a0eab859762')

build() {
    cat > ${srcdir}/robot <<-EOF
	#!/bin/sh
	exec /usr/bin/java -jar '/usr/share/java/robot/robot-${pkgver}.jar' "\$@"
	EOF
}

package() {
    install -Dm644 "${srcdir}/robot.jar" "${pkgdir}/usr/share/java/robot/robot-${pkgver}.jar"
    install -Dm755 "${srcdir}/robot" "${pkgdir}/usr/bin/robot"
}
