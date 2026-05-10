# Maintainer: Eslam Allam eslamallam73@gmail.com
pkgname=docker-sleep-inhibitor
conflicts=()
pkgver=0.0.1
pkgrel=1
pkgdesc="Watches for containers with system.sleep.inhibit=true label and inhibits the system from sleeping"
arch=('any')
url="https://github.com/eslam-allam/docker-sleep-inhibitor"
license=('MIT')   # Change as needed
depends=('docker' 'systemd' 'bash')          # List dependencies
source=("${pkgname}::git+${url}.git#tag=v${pkgver}" "${pkgname}.service")
install="${pkgname}.install"
sha256sums=('6e2d62511848f07fb3c2ebf80e3008e8f7a08b58dc7008f9fa3f2e97ab2305bd'
            'f573338784e3887eff568860061cdf131a97f50057fd6efd58d873866bf46a35')

package() {
  cd "${srcdir}" || exit 1
  install -Dm755 "${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  install -Dm644 "${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
}
