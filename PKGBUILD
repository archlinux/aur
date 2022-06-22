# Maintainer: Fabian Bornschein <fabiscafe-cat-mailbox-dog-com>
# Contributor: Static_Rocket

pkgname=asusctl
pkgver=4.1.1
pkgrel=1
pkgdesc="A control daemon, CLI tools, and a collection of crates for interacting with ASUS ROG laptops"
arch=('x86_64')
url="https://gitlab.com/asus-linux/asusctl"
license=('MPL2')
depends=('hicolor-icon-theme' 'libusb' 'systemd' 'power-profiles-daemon')
optdepends=('acpi_call: fan control')
makedepends=('git' 'rust')
conflicts=('asusctl-git')
_commit=967295fba7faf66f5b76c25056fbb2b42f605665 # tags/4.1.1^0
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
