# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=ruxguitar-bin
pkgver=0.17.0
pkgrel=1
pkgdesc="Guitar Pro tablature player"
arch=('x86_64')
url="https://github.com/agourlay/ruxguitar"
license=('Apache-2.0')
depends=('alsa-lib' 'glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/agourlay/ruxguitar/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/ruxguitar-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_x86_64=('fb234f2cda56cf2484dc339147f05f9ac5435f261865a3ce8fdb6f55574cd6ba')

package() {
  install -Dm755 "ruxguitar" "${pkgdir}/usr/bin/ruxguitar"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
