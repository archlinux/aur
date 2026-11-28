# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=goris-bin
pkgver=3.0.5
pkgrel=1
pkgdesc="Search images with Google reverse image search"
arch=('x86_64')
url="https://github.com/tanaikech/goris"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/tanaikech/goris/v${pkgver}/LICENCE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/goris_linux_amd64")
sha256sums=('8a987fab43e922f7eaf2fd7a1e2cc442c6d68234187d43b231a324c2f39348b6')
sha256sums_x86_64=('ed3147fe48678acf4ec6afeeba919509650940d0014211c68a1407e0fc7055e5')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/goris"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
