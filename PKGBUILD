# Maintainer: Martin Larralde <martin.larralde@ens-paris-saclay.fr>

pkgname=ontodev-robot
pkgver=1.8.2
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
sha256sums=('178254021c6e51bd287483bfa3446c2ab81d4e0c439e43e110d5f21c4bb2a103')

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
