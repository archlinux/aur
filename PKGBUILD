# Maintainer: kewl fft <kewl@alto.eu.org>

pkgname=dse
pkgver=1.33
pkgrel=1
pkgdesc="AES file encryption using a keyfile"
arch=('x86_64')
url="https://github.com/kewlfft/${pkgname}"
makedepends=('glibc')
license=('MIT')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('95c34cce79d68ff749530ef81dcc1112f5b83592884b606405566c4fceedd002')

build() {
    make --directory="${pkgname}-${pkgver}"
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm 0755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm 0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
