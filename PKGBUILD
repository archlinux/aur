# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=pasfmt-bin
pkgver=0.7.0
pkgrel=1
pkgdesc="Delphi code formatter"
arch=('x86_64')
url="https://github.com/integrated-application-development/pasfmt"
license=('LGPL-3.0-only')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/pasfmt-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('c1f02bfee6c7c2868774a27f7907c41b1ea96518f08268c8648fdd00ff5bda2e')

package() {
  install -Dm755 "pasfmt-${pkgver}-x86_64-unknown-linux-gnu/pasfmt" "${pkgdir}/usr/bin/pasfmt"
  install -Dm644 "pasfmt-${pkgver}-x86_64-unknown-linux-gnu/LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "pasfmt-${pkgver}-x86_64-unknown-linux-gnu/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
