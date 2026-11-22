# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=gmsg-bin
pkgver=0.1.7
pkgrel=1
pkgdesc="Generate, edit, and commit AI-powered Git commit messages from a single TUI"
arch=('x86_64')
url="https://github.com/olorikendrick/gmsg"
license=('MIT')
depends=('glibc' 'libgcc' 'openssl-3' 'zlib')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/olorikendrick/gmsg/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/gmsg-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('51cd727f63801e2c4a231a8320632814bd7a0acae231d806b8a3e32b334b96e5')
sha256sums_x86_64=('ddd4aec73611c501a4ef4243c57a4c112255b6eeb50589a62b6ee1504ea5bc6b')

package() {
  install -Dm755 "gmsg" "${pkgdir}/usr/bin/gmsg"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
