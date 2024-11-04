# Maintainer: Uģis Gērmanis <ugis@germanis.lv>
pkgname=blast
pkgver=v0.7.0
pkgrel=3
pkgdesc="send your linux audio to DLNA receivers "
arch=(any)
url="https://github.com/ugjka/blast"
license=('MIT+NoAI')
makedepends=(go go-tools)
conflicts=(blast)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ugjka/blast/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('9c05c0731445b3c4061f3f52bbe4210503ae27e83c15cfcb6121f8dad4dc550f')

build() {
        cd "${srcdir}/${pkgname}-${pkgver:1}"
        GOPATH="${srcdir}"/go go build -modcacherw
}

package() {
        cd "${srcdir}/${pkgname}-${pkgver:1}"
        install -Dm755 ${pkgname} "${pkgdir}"/usr/bin/${pkgname}
        install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
