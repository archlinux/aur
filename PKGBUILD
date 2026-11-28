# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=ticker-wall-bin
pkgver=0.0.3
pkgrel=1
pkgdesc="Scalable stock ticker tape display"
arch=('x86_64')
url="https://github.com/massive-com/ticker-wall"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/massive-com/ticker-wall/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/tickerwall-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('124c056b2db6e8bb6eb18ecdf54b331bedeaa867333606df54d6ebdb9122c409')
sha256sums_x86_64=('632a0cccc523f8cc84a1a23af2f23bcb5e897895fc4a9eb0d9c1b55c299de875')

package() {
  install -Dm755 "tickerwall" "${pkgdir}/usr/bin/tickerwall"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
