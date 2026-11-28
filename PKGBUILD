# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=geni-bin
pkgver=1.3.3
pkgrel=1
pkgdesc="Database migration tool for Postgres, MariaDB, MySQL, SQLite and LibSQL"
arch=('x86_64' 'aarch64')
url="https://github.com/emilpriver/geni"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/emilpriver/geni/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/geni-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/geni-linux-arm64")
sha256sums=('04f8bf2c9be9d5ad0a982b4212faff8bad14a55ae48faa7d2c98c15ef1a77a9b')
sha256sums_x86_64=('ce1f4e56279ca239fe8e89aa743cbed9e21da790a2511b28fa91802b730e0ee0')
sha256sums_aarch64=('a0de57b39bdfe7c61ebff53eda2aadb74e8c59f5995054ecbcf980c6abb3a1c5')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/geni"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
