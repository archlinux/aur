# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=mark-bin
pkgver=17.4.0
pkgrel=1
pkgdesc="Sync your markdown files with Confluence pages"
arch=('x86_64' 'aarch64')
url="https://github.com/kovetskiy/mark"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/mark_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/mark_Linux_arm64.tar.gz")
sha256sums_x86_64=('2906b994df64e7eea9d0757912b160d04ee34f7812df10aaa31aacf3ebc5276a')
sha256sums_aarch64=('7197bd93c80ea7345d01670b097b401f05272441dc5c336065e68fb2a234197e')

package() {
  install -Dm755 "mark" "${pkgdir}/usr/bin/mark"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
