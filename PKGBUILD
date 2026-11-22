# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=trex-tui-bin
pkgver=0.6.4
pkgrel=1
pkgdesc="A fast tmux session manager with fuzzy finding, per session stats and AI Agent tracking"
arch=('x86_64' 'aarch64')
url="https://github.com/blackopsrepl/trex"
license=('ISC')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/blackopsrepl/trex/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/trex-linux-x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/trex-linux-aarch64.tar.gz")
sha256sums=('90c9a7ef0f0fa2ab1cc89c9f1484b030df05cb8dad4f21967f12619406b7115e')
sha256sums_x86_64=('365b73c358ca1699cc66889421b26d18dab61c9e296ef050d5cbeb153aa8991f')
sha256sums_aarch64=('b9568ce3022715e7596d370aa02637c61c3907836a46db3a7de9392c59cb1daa')

package() {
  install -Dm755 "trex" "${pkgdir}/usr/bin/trex"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
