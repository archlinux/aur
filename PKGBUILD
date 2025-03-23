# Maintainer: Uģis Gērmanis <ugis@germanis.lv>
pkgname=sblast
pkgver=v0.7.1
pkgrel=1
pkgdesc="Cast your Linux audio to DLNA receivers"
arch=(any)
url="https://github.com/ugjka/sblast"
license=('MIT+NoAI')
makedepends=(go)
options=(!debug !strip)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ugjka/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('a8f7d58e8bbe05fc8f4a97ec027c3383b8c6051b35af6c3a4a87c2614b6502f2')

build() {
        cd "${srcdir}/${pkgname}-${pkgver:1}"
        GOPATH="${srcdir}"/go go build -modcacherw
}

package() {
        cd "${srcdir}/${pkgname}-${pkgver:1}"
        install -Dm755 ${pkgname} "${pkgdir}"/usr/bin/${pkgname}
        install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
