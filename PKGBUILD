# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=hongdown-bin
pkgver=0.5.3
pkgrel=1
pkgdesc="Markdown formatter enforcing Hong Minhee's style conventions"
arch=('x86_64' 'aarch64')
url="https://github.com/dahlia/hongdown"
license=('GPL-3.0-only')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.bz2::${_dl}/hongdown-${pkgver}-x86_64-unknown-linux-gnu.tar.bz2")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.bz2::${_dl}/hongdown-${pkgver}-aarch64-unknown-linux-gnu.tar.bz2")
sha256sums_x86_64=('d67c2c7c92096bba82eef4b40205f74d3abd34f84787639bf9d3ee7b3f0895e4')
sha256sums_aarch64=('9e7380a302bdf9d0f49fd43c27495ee1c1fb181eb5e7fd675bbe23ff5c8bb785')

package() {
  install -Dm755 "hongdown" "${pkgdir}/usr/bin/hongdown"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
