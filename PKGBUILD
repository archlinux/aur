# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=giga-grabber-bin
pkgver=1.3.6
pkgrel=1
pkgdesc="Fast Mega downloader"
arch=('x86_64')
url="https://github.com/chanderlud/giga-grabber"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/chanderlud/giga-grabber/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/giga-grabber-${pkgver}-linux-standalone-x86_64")
sha256sums=('11da3e56f183654bf4add0932b07b33afa854b5d1d479bb794ff4dc878fa11ad')
sha256sums_x86_64=('bfec4c78688255ebabf45381405c47b67d17b9f6a3a79eec988af561467c346b')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/giga-grabber"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
