# Maintainer: <_@_._>

pkgname=pve-spice-connect-git
pkgver=r11.bebc2e4
pkgrel=1
pkgdesc="A bash script to easily connect to Proxmox PVE virtual machines via SPICE."
arch=('x86_64')
url="https://gitlab.com/pawlakm/pve-spice-connect"
license=('GPL3')
provides=('pve-spice-connect')
depends=('bash' 'curl' 'jq' 'virt-viewer')
makedepends=('git')
source=("git+https://gitlab.com/pawlakm/pve-spice-connect.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  cd "${pkgname%-git}"
  install -d "${pkgdir}/usr/bin" "${pkgdir}/usr/share/doc/${pkgname%-git}/"
  install -Dm755 "pvespiceconnect.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname%-git}/README.md"
}
