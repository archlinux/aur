# Maintainer: Uģis Gērmanis <ugis@germanis.lv>
pkgname=sblast
pkgver=v0.7.0
pkgrel=3
pkgdesc="Cast your Linux audio to DLNA receivers"
arch=(any)
url="https://github.com/ugjka/sblast"
license=('MIT+NoAI')
makedepends=(go)
options=(!debug !strip)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ugjka/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('46e0e9ed33483a770ce6bb7f5eef2439c42cef72b120cacb071cd2ad56c7b4a5')

build() {
        cd "${srcdir}/${pkgname}-${pkgver:1}"
        GOPATH="${srcdir}"/go go build -modcacherw
}

package() {
        cd "${srcdir}/${pkgname}-${pkgver:1}"
        install -Dm755 ${pkgname} "${pkgdir}"/usr/bin/${pkgname}
        install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
