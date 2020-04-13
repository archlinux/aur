# Maintainer: kewl fft <kewl@alto.eu.org>

pkgname=dse
pkgver=1.32
pkgrel=1
pkgdesc="AES file encryption using a keyfile"
arch=('x86_64')
url="https://github.com/kewlfft/${pkgname}"
makedepends=('glibc')
license=('MIT')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('5de0ac6455b785d9f16156095cf4fd87f32de575034959357b2f5b2fea962ec7')

build() {
    make --directory="${pkgname}-${pkgver}"
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm 0755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm 0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
