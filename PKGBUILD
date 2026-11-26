# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=clawk-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="Give coding agents a disposable Linux VM instead of your laptop"
arch=('x86_64' 'aarch64')
url="https://github.com/clawkwork/clawk"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/clawk-v${pkgver}-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/clawk-v${pkgver}-linux-arm64.tar.gz")
sha256sums_x86_64=('467322521d2a80a9bdedf86314ae5ed9982a349e8e97697995c8725e1c96bf34')
sha256sums_aarch64=('1bb36d82a69bec1074c7227f3d454dd308779d543afe6a712c22d98fc54cee3d')

package() {
  install -Dm755 "clawk" "${pkgdir}/usr/bin/clawk"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
