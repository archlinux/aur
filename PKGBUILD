# Maintainer: Martin Rys <rys.pw/#contact_me>
pkgname=jitsi-meet-git
pkgver=r1.9a162c2
pkgrel=2
epoch=
pkgdesc="WebRTC JavaScript video conferences"
arch=("x86_64")
url="https://github.com/jitsi/jitsi-meet"
license=("Apache")
groups=()
depends=("npm")
makedepends=("git")
checkdepends=()
optdepends=()
provides=("jitsi-meet")
conflicts=("jitsi-meet")
replaces=()
backup=("opt/jitsi-meet/config.js")
options=()
install=
changelog=
source=($pkgname::git+https://github.com/jitsi/jitsi-meet)
noextract=()
sha256sums=("SKIP")
validpgpkeys=()

build() {
  cd "${srcdir}/${pkgname}"
  npm install
  # Make fails with more than one thread
  make -j1
}

package() {
  install -d "${pkgdir}/opt"
  cp -R "${srcdir}/jitsi-meet-git/" "${pkgdir}/opt/jitsi-meet"
}
