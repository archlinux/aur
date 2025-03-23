# Maintainer: Uģis Gērmanis <ugis@germanis.lv>
pkgname=sblast
pkgver=v0.7.2
pkgrel=1
pkgdesc="Cast your Linux audio to DLNA receivers"
arch=(any)
url="https://github.com/ugjka/sblast"
license=('MIT+NoAI')
makedepends=(go)
options=(!debug !strip)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ugjka/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('3a86f343ccd60c36043020949c8d8b80301d4ebe369c74698ac6688cb3f3cbef')


build() {
        cd "${srcdir}/${pkgname}-${pkgver:1}"
        GOPATH="${srcdir}"/go go build -modcacherw
}

package() {
        cd "${srcdir}/${pkgname}-${pkgver:1}"
        install -Dm755 ${pkgname} "${pkgdir}"/usr/bin/${pkgname}
        install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
