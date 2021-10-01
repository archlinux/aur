# Maintainer: Strykar <strykar@hotmail.com>

pkgname=go-livepeer-bin
_pkgname=go-livepeer
pkgver=0.5.21
pkgrel=1
pkgdesc='Official Go binaries of the Livepeer protocol'
arch=('x86_64')
url='https://github.com/livepeer/go-livepeer'
license=('MIT')
conflicts=('go-livepeer')
provides=('go-livepeer' 'go-livepeer-bin')
source=("https://github.com/livepeer/${_pkgname}/releases/download/v${pkgver}/livepeer-linux-amd64.tar.gz"
  "https://raw.githubusercontent.com/livepeer/go-livepeer/master/LICENSE"
  "environment"
  "livepeer.service")
sha256sums=('aa966e0af5599faf04d1c9334da36f59e3f6007ca23fc0f21c7c2379b998f0e4'
            'c4de4cf3034bc69b6832f22ea3e18957639e41f2ad7d4cfed6919f6e0dbf99ba'
            '723b9b7d821a6ec6194e89b6e4b972c99df534ba139f7fc29843e2fcc12771de'
            'f7af239c0ff3ec8cd7d69d75f8e3073e42dce2a87ffda1cc6a21ce3e0b97859c')
package() {
  install -Dm 644 "${srcdir}/environment" -t "${pkgdir}/etc/${_pkgname}"
  install -Dm 644 "${srcdir}/livepeer.service" -t "${pkgdir}/usr/lib/systemd/system"
  install -Dm 644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 755 "${srcdir}/livepeer-linux-amd64/livepeer" "${pkgdir}/usr/bin/livepeer"
  install -Dm 755 "${srcdir}/livepeer-linux-amd64/livepeer_cli" "${pkgdir}/usr/bin/livepeer_cli"
  install -Dm 755 "${srcdir}/livepeer-linux-amd64/livepeer_bench" "${pkgdir}/usr/bin/livepeer_bench"
  install -Dm 755 "${srcdir}/livepeer-linux-amd64/livepeer_router" "${pkgdir}/usr/bin/livepeer_router"
}
