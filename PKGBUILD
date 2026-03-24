pkgname=meowcli-bin
pkgver=0.3.1beta
pkgrel=1
pkgdesc='High-performance API forwarding service for CLI tools'
arch=('x86_64' 'aarch64')
url='https://github.com/nekohy/MeowCLI'
license=('custom:unknown')
install='meowcli-bin.install'
provides=("meowcli=${pkgver}")
options=('!strip' '!debug')

source_x86_64=("${pkgname}-${pkgver}-x86_64::https://github.com/nekohy/MeowCLI/releases/download/v${pkgver}/meowcli-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::https://github.com/nekohy/MeowCLI/releases/download/v${pkgver}/meowcli-linux-arm64")
sha256sums_x86_64=('437dcece02cb98a0c1c48095419be3e8e7fda549627fa65477118b61ecfb5034')
sha256sums_aarch64=('a4bb3f86833eab6bc37ab95c0ff6aaa935b06416b320e8960b6a13f0116fb226')

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/meowcli"
}
