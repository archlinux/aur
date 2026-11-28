# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=textpod-bin
pkgver=0.1.8
pkgrel=1
pkgdesc="Simple note-taking app inspired by One Big Text File"
arch=('x86_64')
url="https://github.com/freetonik/textpod"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/freetonik/textpod/${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/textpod-gnu-linux-x86_64.tar.gz")
sha256sums=('8b1ba204bb69a0ade2bfcf65ef294a920f6bb361b317dba43c7ef29d96332b9b')
sha256sums_x86_64=('359d9a28854f53f75cfb0321e0ce854e0198a135b517e9792a7da5c8c8ad3183')

package() {
  install -Dm755 "textpod" "${pkgdir}/usr/bin/textpod"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
