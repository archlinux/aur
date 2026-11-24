# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=keydex-bin
pkgver=0.13.0
pkgrel=1
pkgdesc="Terminal password manager for KeePass databases"
arch=('x86_64' 'aarch64')
url="https://github.com/shikaan/keydex"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/shikaan/keydex/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/keydex-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/keydex-linux-arm64")
sha256sums=('119ca7fd3be4f223fd58baec26f4b32886626180e8771f68f1db1d7be3caa8ad')
sha256sums_x86_64=('053a31d902560ec6bd7441446296174276d8893210fc3fc3eda0536a9df68457')
sha256sums_aarch64=('2ebbd27131ec3f8c12925dcdae49296b7aac15e7a52bbe65920055d57ef6ba1a')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/keydex"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
