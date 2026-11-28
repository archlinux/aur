# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=igor-php-bin
pkgver=0.11.0
pkgrel=1
pkgdesc="Static analysis for FrankenPHP worker mode state bugs"
arch=('x86_64' 'aarch64')
url="https://github.com/igor-php/igor-php"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/igor-php_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/igor-php_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('c799c02830eeb3e91cb9fcfeb6a2ec8da34ebcade27d6d55496f93253cc866c5')
sha256sums_aarch64=('ccc6347a05ec5430a97d98c728550517bbe5ce128f7b952a12df9775e91cd8b6')

package() {
  install -Dm755 "igor-php" "${pkgdir}/usr/bin/igor-php"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
