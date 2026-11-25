# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=ezbookkeeping-bin
pkgver=2.2.0
pkgrel=1
pkgdesc="ezBookkeeping is an open source, powerful, self-hosted personal finance app that is easy to use"
arch=('x86_64' 'aarch64')
url="https://github.com/mayswind/ezbookkeeping"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/ezbookkeeping-v${pkgver}-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/ezbookkeeping-v${pkgver}-linux-arm64.tar.gz")
sha256sums_x86_64=('fd47536a4a368b784ae9f8506ba99706da8524c78e7f0a88cffa6ff14ea12eb1')
sha256sums_aarch64=('85494358ffba5574844d01e15e16420a4e0bdf08eb1c8e9501a52c3f832e563b')

package() {
  install -Dm755 "ezbookkeeping" "${pkgdir}/usr/bin/ezbookkeeping"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
