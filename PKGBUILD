# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=kktypr-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="Terminal touch typing academy and developer code syntax trainer in pure Rust"
arch=('x86_64')
url="https://github.com/kk376/kktypr"
license=('MIT OR Apache-2.0')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/kktypr-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('b082bdf9fc7c7543f49a7fd350cc715cf741f4ea6974e5d100c25b3c788b8097')

package() {
  cd "kktypr-${pkgver}-x86_64-unknown-linux-gnu"
  install -Dm755 "kktypr" "${pkgdir}/usr/bin/kktypr"
  install -Dm644 "kktypr.1" -t "${pkgdir}/usr/share/man/man1"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "LICENSE-MIT" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "LICENSE-APACHE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
