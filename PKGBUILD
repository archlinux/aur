# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=pgit-bin
pkgver=4.2.0
pkgrel=1
pkgdesc="Git-like version control backed by PostgreSQL"
arch=('x86_64' 'aarch64')
url="https://github.com/ImGajeed76/pgit"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/pgit_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/pgit_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('c8a59a7e15a75ad16008942920046055bc0e19b0c341b431db7e61f79cbbadea')
sha256sums_aarch64=('059fcd2f2c617e03b9ebd355e05da98b55745e21dbd8d18e94e1921b5f256cc0')

package() {
  install -Dm755 "pgit" "${pkgdir}/usr/bin/pgit"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
