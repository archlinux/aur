# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=fabio-bin
pkgver=1.6.3
pkgrel=1
pkgdesc='Consul Load-Balancing made simple'
arch=('x86_64')
url="https://fabiolb.net"
_githuburl="https://github.com/fabiolb/fabio"
license=('MIT')
provides=()
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux_amd64"
    "LICENSE::${_githuburl}/raw/master/LICENSE")
sha256sums=('9c899294519ddbe4aaf314ddb2851d8fcf2f3af9e2080878ad7dfe17440e202a'
            '1b96863084c41c1557336dad7193f7b0d4c03042481da83136b53940ea5a3083')

package() {
  install -Dm755 "${srcdir}/${pkgname%-bin}-${pkgver}" "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}