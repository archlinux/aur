# Maintainer: Norbert <sandwich@archworks.co>

pkgname=semaphore-bin
pkgver=2.18.4
pkgrel=1
pkgdesc="Modern UI for Ansible (Binary Release)"
arch=('x86_64' 'aarch64')
url="https://www.semaphoreui.com/"
license=('MIT')
depends=('ansible-core')
optdepends=(
  'ansible: Full Ansible assortment'
  'postgresql: PostgreSQL database support'
  'mariadb: MariaDB database support'
  'postfix: Mail server support'
)
install=semaphore.install
source=(
  "semaphore.service"
  "semaphore.sysusers.d"
)
source_x86_64=("https://github.com/semaphoreui/semaphore/releases/download/v${pkgver}/semaphore_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/semaphoreui/semaphore/releases/download/v${pkgver}/semaphore_${pkgver}_linux_arm64.tar.gz")
sha256sums=('3fde097494ba8433a972b3cdf175a4feff66005e21d4009b07437686220b9a00'
            'fb2699dfd2c5873ae5ffb340bb38d88ea7ab39034f338ba2915e8e91320e9945')
sha256sums_x86_64=('bf6b8116824dc818879a40a90bf884194ea4e1e5fe0b3fce1e033927aa609e5b')
sha256sums_aarch64=('dd52d98fdc20e7cccefffb1c35b57c234b88ca6022ab9fa92278fd79842c50e4')

package() {
  install -Dm755 "semaphore" "${pkgdir}/usr/bin/semaphore"
  install -Dm644 "semaphore.service" -t "${pkgdir}/usr/lib/systemd/system"
  install -Dm644 "semaphore.sysusers.d" "${pkgdir}/usr/lib/sysusers.d/semaphore.conf"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
