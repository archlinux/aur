# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=morloc-bin
pkgver=0.114.0
pkgrel=1
pkgdesc="Strongly typed polyglot compiler"
arch=('x86_64')
url="https://github.com/morloc-project/morloc"
license=('Apache-2.0')
depends=('glibc' 'gmp' 'zlib')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/morloc-project/morloc/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/morloc-linux-x86_64")
sha256sums=('b47d430d8678ad98f625a9a6bb846f9953ff2efcebf8342865438bea3f841670')
sha256sums_x86_64=('965b1db578e811474207bbf22a396215778fddcb634fcb174c35a5f6ceb046c8')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/morloc"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
