# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=eonza-bin
pkgver=1.29.0
pkgrel=1
pkgdesc="Script and automation tool with a web interface"
arch=('x86_64')
url="https://github.com/gentee/eonza"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/gentee/eonza/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/eonza-${pkgver}-linux-amd64.tar.gz")
sha256sums=('e2718feee1c4eeeaeefb741366e7c0d8b9325d5d49573a1a13b6991554461d65')
sha256sums_x86_64=('b5572ecfecc5226a0c3d31e2b00f6e63ea257e4ac0f5b468a6ee7946457da579')

package() {
  install -Dm755 "eonza" "${pkgdir}/usr/bin/eonza"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
