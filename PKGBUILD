# Maintainer: Mike Macpherson <mmacpherson@noreply.github.io>

pkgname=expirito
pkgver=1.3.1
pkgrel=1
epoch=
pkgdesc="A utility to clean up old files and empty directories"
arch=("any")
url="https://github.com/mmacpherson/${pkgname}"
license=("MIT")
depends=("python" "python-yaml" "python-pathspec")
makedepends=("git")
provides=("${pkgname}")
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(
  "git+https://github.com/mmacpherson/${pkgname}.git#tag=v${pkgver}"
)
sha256sums=("SKIP")


package() {
  cd "${srcdir}/${pkgname}"

  install -Dm755 expirito.py "${pkgdir}/usr/bin/expirito"
  install -Dm644 systemd/expirito.service "${pkgdir}/usr/lib/systemd/user/expirito.service"
  install -Dm644 systemd/expirito.timer "${pkgdir}/usr/lib/systemd/user/expirito.timer"
}
