# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=rguilayout-bin
pkgver=4.0
pkgrel=1
pkgdesc="Simple raygui layout editor"
arch=('x86_64')
url="https://github.com/raysan5/rguilayout"
license=('Zlib')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/raysan5/rguilayout/${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::${_dl}/rguilayout_v${pkgver}_linux_x64.zip")
sha256sums=('ed2b167044cfee999e8a3ee19b619f91c33fc20ccaabfe314d3bd5f7880c5577')
sha256sums_x86_64=('efc30608b21689f7b077932af83227ff6e47bf9c24b81ef7f28adf91accf62a1')

package() {
  install -Dm755 "rguilayout_v${pkgver}_linux_x64/rguilayout" "${pkgdir}/usr/bin/rguilayout"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "rguilayout_v${pkgver}_linux_x64/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
