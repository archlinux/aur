# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=net-merge-bin
pkgver=0.3.7
pkgrel=1
pkgdesc="Use all your internet connections at once on Windows, macOS, Linux and Android: per-connection load balancing over Wi-Fi, Ethernet, mobile data and phone tethers"
arch=('x86_64' 'aarch64')
url="https://github.com/net-merge/net-merge"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/net-merge-linux-x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/net-merge-linux-aarch64.tar.gz")
sha256sums_x86_64=('4bba086500c6f931ce94358833ce05b14abcb5d1af76698827aee963e12d1a86')
sha256sums_aarch64=('b0dafa703b5dceec7f8daf935cbfad849f085701ffcc9dfa2ae67a60744b5796')

package() {
  install -Dm755 "net-merge" "${pkgdir}/usr/bin/net-merge"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
