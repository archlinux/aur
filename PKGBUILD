# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=lific-bin
pkgver=3.0.0
pkgrel=1
pkgdesc="Local-first, lightweight issue tracker"
arch=('x86_64' 'aarch64')
url="https://github.com/VoidNullable/lific"
license=('Apache-2.0')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/VoidNullable/lific/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/lific-linux-x86_64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/lific-linux-aarch64")
sha256sums=('eea6648f7d5c389db3a7ed39a7d450a7b0a34749aeae9afab8e3471dcf8fde96')
sha256sums_x86_64=('05a20d7b594f340093330b46de348e12ed25da71bf8211ac5aa3f0665248619b')
sha256sums_aarch64=('5d08c05762cb74ec84d584d92637c35ac5c7f2a4fe081b413d94dc19c01eb5ec')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/lific"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
