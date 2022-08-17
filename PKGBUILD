# Maintainer: Strykar <strykar@hotmail.com>

pkgname=go-livepeer-bin
_pkgname=go-livepeer
pkgver=0.5.34
pkgrel=1
pkgdesc='Official Go binaries of the Livepeer protocol'
arch=('x86_64')
url='https://github.com/livepeer/go-livepeer'
license=('MIT')
install=${_pkgname}.install
backup=('etc/go-livepeer/livepeer.conf')
conflicts=('go-livepeer')
provides=('go-livepeer' 'go-livepeer-bin')
source=("https://github.com/livepeer/${_pkgname}/releases/download/v${pkgver}/livepeer-linux-amd64.tar.gz"
  "https://raw.githubusercontent.com/livepeer/go-livepeer/master/LICENSE"
  "livepeer.conf"
  "livepeer.service")
sha256sums=('1a53c8ee0be0c93b9f1f6a2458ce469401b7623e577a3c22708446c0c21df5a9'
            'c4de4cf3034bc69b6832f22ea3e18957639e41f2ad7d4cfed6919f6e0dbf99ba'
            '82a7bc93294938bd4621f7515c29ffe01c5e9fbc795dff59b82a5ad0ded42cca'
            '7c2f96d5410bb9d8249c90431e97833686bf0909f8c673226c8436a6f3abdadc')
package() {
  install -Dm 644 "${srcdir}/livepeer.conf" "${pkgdir}/etc/${_pkgname}/livepeer.conf"
  install -Dm 644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -Dm 755 "${srcdir}/livepeer-linux-amd64/livepeer" "${pkgdir}/usr/bin/livepeer"
  install -Dm 755 "${srcdir}/livepeer-linux-amd64/livepeer_cli" "${pkgdir}/usr/bin/livepeer_cli"
  install -Dm 644 "${srcdir}/livepeer.service" "${pkgdir}/usr/lib/systemd/system/livepeer.service"
  install -Dm 755 "${srcdir}/livepeer-linux-amd64/livepeer_bench" "${pkgdir}/usr/bin/livepeer_bench"
  install -Dm 755 "${srcdir}/livepeer-linux-amd64/livepeer_router" "${pkgdir}/usr/bin/livepeer_router"
}
