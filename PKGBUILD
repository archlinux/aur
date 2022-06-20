# Maintainer: Fabian Bornschein <fabiscafe-cat-mailbox-dog-com>
# Contributor: Static_Rocket

pkgname=asusctl
pkgver=4.1.0
pkgrel=1
pkgdesc="Asus hardware control utilities"
arch=('x86_64')
url="https://gitlab.com/asus-linux/asusctl"
license=('MPL2')
depends=('hicolor-icon-theme' 'libusb' 'systemd' 'power-profiles-daemon')
optdepends=('acpi_call: fan control')
makedepends=('git' 'rust')
conflicts=('asusctl-git')
_commit=5403c5fb4f491c34d75a3fb3197b8396ff22700a # tags/4.1.0^0
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
