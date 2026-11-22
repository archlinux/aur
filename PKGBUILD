# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=crmux-bin
pkgver=0.20.3
pkgrel=1
pkgdesc="A TUI viewer for monitoring and managing multiple Claude Code sessions"
arch=('x86_64')
url="https://github.com/maedana/crmux"
license=('MIT')
depends=('glibc' 'libgcc' 'openssl-3')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/maedana/crmux/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/crmux-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('d6a873066c714d094dd86fc2bd250dd239c199748112f78ec66577a7606e7871')
sha256sums_x86_64=('826c2f6cc2c9cc136afe734c00a08e7d867e54f350ac9aa2403b75b2a2232471')

package() {
  install -Dm755 "crmux" "${pkgdir}/usr/bin/crmux"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
