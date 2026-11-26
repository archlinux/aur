# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=jormungandr-bin
pkgver=0.15.1
pkgrel=1
pkgdesc="Cardano Jormungandr blockchain node"
arch=('x86_64' 'aarch64')
url="https://github.com/cardano-foundation/jormungandr"
license=('Apache-2.0')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/cardano-foundation/jormungandr/v${pkgver}/LICENSE-APACHE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/jormungandr-${pkgver}-x86_64-unknown-linux-gnu-generic.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/jormungandr-${pkgver}-aarch64-unknown-linux-gnu-generic.tar.gz")
sha256sums=('1ca206082309bb9901d775d27cd838ebaa88b1eb80f858cdbfafda52cc9a9082')
sha256sums_x86_64=('ba2a4f29509bcd404c27bc4c67a1f9e9de6fff6c7ac41d6f88821994ed327671')
sha256sums_aarch64=('0c252f92407a31ae48bf3810645f2d60681149a87b5cfdf227725d16d792cd9d')

package() {
  install -Dm755 "jormungandr" "${pkgdir}/usr/bin/jormungandr"
  install -Dm755 "jcli" "${pkgdir}/usr/bin/jcli"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
