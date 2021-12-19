# Maintainer: Fabian Bornschein <fabiscafe-cat-mailbox-dog-com>
# Contributor: Static_Rocket

pkgname=asusctl
pkgver=4.0.7
pkgrel=1
pkgdesc="Asus hardware control utilities"
arch=('x86_64')
url="https://gitlab.com/asus-linux/asusctl"
license=('MPL2')
depends=('hicolor-icon-theme' 'libusb' 'systemd' 'power-profiles-daemon')
optdepends=('acpi_call: fan control')
makedepends=('git' 'rust')
conflicts=('asusctl-git')
_commit=ba40c3f739462a2488dd05c96ce7f81372311fd7 # tags/4.0.7^0
source=("git+${url}.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  git describe --tags | sed 's/-/+/g'
}

build() {
  cd "${pkgname}"
  make build
}

package() {
  cd "${pkgname}"
  make DESTDIR="${pkgdir}" install
}
