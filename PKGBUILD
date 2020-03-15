# Maintainer: Martin Rys <rys.pw/#contact_me>
pkgname=jicofo-git
pkgver=r1.938738f
pkgrel=1
epoch=
pkgdesc="JItsi Meet COnference FOcus"
arch=("x86_64")
url="https://github.com/jitsi/jicofo"
license=("Apache")
groups=()
depends=("java-runtime-headless" "maven" "unzip")
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=($pkgname::git+https://github.com/jitsi/jicofo)
noextract=()
sha256sums=("SKIP")
validpgpkeys=()

build() {
  cd "${srcdir}/${pkgname}"
  mvn package -DskipTests -Dassembly.skipAssembly=false
  unzip -o target/jicofo-1.1-SNAPSHOT-archive.zip
}

package() {
  install -d "${pkgdir}/opt"
  cp -R "${srcdir}/jicofo-git/jicofo-1.1-SNAPSHOT/" "${pkgdir}/opt/jicofo"
}
