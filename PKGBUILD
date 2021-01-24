# Maintainer: kewl fft <kewl@alto.eu.org>

pkgname=dse
pkgver=1.34
pkgrel=1
pkgdesc="AES file encryption using a keyfile"
arch=('x86_64')
url="https://github.com/kewlfft/${pkgname}"
makedepends=('glibc')
license=('MIT')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('03f90100d7928506a3f232933a27e69696bf837465f79b0fc92e01da82ab2ebb')

build() {
    make --directory="${pkgname}-${pkgver}"
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm 0755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm 0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
