# Maintainer: Strykar <strykar@hotmail.com>

pkgname=go-livepeer-bin
_pkgname=go-livepeer
pkgver=0.5.21
pkgrel=1
pkgdesc='Official Go binaries of the Livepeer protocol'
arch=('x86_64')
url='https://github.com/livepeer/go-livepeer'
license=('MIT')
install=${_pkgname}.install
backup=('etc/go-livepeer/environment')
conflicts=('go-livepeer')
provides=('go-livepeer' 'go-livepeer-bin')
source=("https://github.com/livepeer/${_pkgname}/releases/download/v${pkgver}/livepeer-linux-amd64.tar.gz"
  "https://raw.githubusercontent.com/livepeer/go-livepeer/master/LICENSE"
  "environment"
  "livepeer.service")
sha256sums=('aa966e0af5599faf04d1c9334da36f59e3f6007ca23fc0f21c7c2379b998f0e4'
            'c4de4cf3034bc69b6832f22ea3e18957639e41f2ad7d4cfed6919f6e0dbf99ba'
            'dfe28d5e3ff4cdd384f873ab767ca40a49aad7e282a42898469b20c4b5167d56'
            '09f42fd378e629b220d68905b492536276f7980274a0930d92e9d63b0b5a27b2')
package() {
  install -Dm 644 "${srcdir}/environment" -t "${pkgdir}/etc/${_pkgname}"
  install -Dm 644 "${srcdir}/livepeer.service" -t "${pkgdir}/usr/lib/systemd/system"
  install -Dm 644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -Dm 755 "${srcdir}/livepeer-linux-amd64/livepeer" "${pkgdir}/usr/bin/livepeer"
  install -Dm 755 "${srcdir}/livepeer-linux-amd64/livepeer_cli" "${pkgdir}/usr/bin/livepeer_cli"
  install -Dm 755 "${srcdir}/livepeer-linux-amd64/livepeer_bench" "${pkgdir}/usr/bin/livepeer_bench"
  install -Dm 755 "${srcdir}/livepeer-linux-amd64/livepeer_router" "${pkgdir}/usr/bin/livepeer_router"
}
