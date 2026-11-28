# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=skillspec-bin
pkgver=0.2.2
pkgrel=1
pkgdesc="Make AI agent skills followable, testable and provable"
arch=('x86_64')
url="https://github.com/modiqo/skillspec"
license=('Apache-2.0')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/modiqo/skillspec/v${pkgver}/LICENSE-APACHE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/skillspec-linux-x86_64.tar.gz")
sha256sums=('4adf88f072b989df98ff8f5082c02bfd667f63f098d6677443e93d527abd97d0')
sha256sums_x86_64=('90042dddb04ea4eee30005c09af74b49abe08995d4583cb24de3f1ad8c501228')

package() {
  install -Dm755 "skillspec" "${pkgdir}/usr/bin/skillspec"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
