# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=datanymizer-bin
pkgver=0.7.4
pkgrel=1
pkgdesc="Database anonymizer with flexible rules"
arch=('x86_64')
url="https://github.com/datanymizer/datanymizer"
license=('MIT')
depends=('glibc' 'libgcc' 'openssl-3')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/datanymizer/datanymizer/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/pg_datanymizer-linux-x86_64.tar.gz")
sha256sums=('56880028a25c8329423a0ec2c62c834e8c39836cc38fc734c3643a973f7ee62d')
sha256sums_x86_64=('28953d57111c7ff47abb79283d24e9ef71c00a410ca5f6d53234e1077a26db7d')

package() {
  install -Dm755 "pg_datanymizer" "${pkgdir}/usr/bin/pg_datanymizer"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
