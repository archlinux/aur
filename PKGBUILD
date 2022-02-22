# Maintainer: Strykar <strykar@hotmail.com>

pkgname=go-livepeer-bin
_pkgname=go-livepeer
pkgver=0.5.29
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
sha256sums=('276936a0d3d3dea9fbacfc464ee1c12deddc4262c20427e0c3f9a2cfeeb1a6ac'
            'c4de4cf3034bc69b6832f22ea3e18957639e41f2ad7d4cfed6919f6e0dbf99ba'
            '82a7bc93294938bd4621f7515c29ffe01c5e9fbc795dff59b82a5ad0ded42cca'
            '7e4cdda1a07d059ba5a7f04e425360148cf745aff31ce1a5c3e7d124e715b0ea')
package() {
  install -dm750 -o8935 -g8935 "{$pkgdir}/var/lib/livepeer"
  install -dm755 -o8935 -g8935 "{$pkgdir}/var/cache/livepeer"
  install -Dm 644 "${srcdir}/livepeer.conf" "${pkgdir}/etc/${_pkgname}/livepeer.conf"
  install -Dm 644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -Dm 755 "${srcdir}/livepeer-linux-amd64/livepeer" "${pkgdir}/usr/bin/livepeer"
  install -Dm 644 "${srcdir}/livepeer.sysusers" "${pkgdir}/usr/lib/sysusers.d/livepeer.conf"
  install -Dm 755 "${srcdir}/livepeer-linux-amd64/livepeer_cli" "${pkgdir}/usr/bin/livepeer_cli"
  install -Dm 644 "${srcdir}/livepeer.service" "${pkgdir}/usr/lib/systemd/system/livepeer.service"
  install -Dm 755 "${srcdir}/livepeer-linux-amd64/livepeer_bench" "${pkgdir}/usr/bin/livepeer_bench"
  install -Dm 755 "${srcdir}/livepeer-linux-amd64/livepeer_router" "${pkgdir}/usr/bin/livepeer_router"
}
