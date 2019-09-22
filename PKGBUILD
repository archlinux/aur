# Maintainer: kewl fft <kewl@alto.eu.org>

pkgname=dse
pkgver=1.31
pkgrel=1
pkgdesc="AES file encryption using a keyfile"
arch=('x86_64')
url="https://github.com/kewlfft/${pkgname}"
makedepends=('glibc')
license=('MIT')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('963bc2ae492f4f726227ba1494189b4d25b5aff0a082aadc2276f33d766a6d92')

build() {
    make --directory="${pkgname}-${pkgver}"
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm 0755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm 0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
