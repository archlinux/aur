# Maintainer: Martin Larralde <martin.larralde@ens-paris-saclay.fr>

pkgname=ontodev-robot
pkgver=1.9.0
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
sha256sums=('ae738ce536a1e581427057b14037f70ac11f31e5532b43dcca02a43f964304f9')

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
