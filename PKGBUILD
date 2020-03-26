# Maintainer: Shyamin Ayesh <me@shyamin.com>

pkgname=flutter-sdk
pkgver=1.16.2
pkgrel=1
arch=("x86_64")
license=("BSD")
pkgdesc="Flutter SDK"
url="github.com/flutter/flutter"
source=(
    "https://${url}/archive/v${pkgver}.tar.gz"
    "${pkgname}.sh"
)
sha256sums=(
    "deb64d9b60eb2507a040962eb1d0fb3a70f9e215e38b20343e5278088ad2e3c5"
    "e309e4b553dce319ad8907cc95e2f69eced88f30e23f7da6272766e7342ed249"
)


prepare() {
    mv "flutter-${pkgver}" "${pkgname}"
}


package() {

    # ENV
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/etc/profile.d/${pkgname}.sh"

    # LICENSE
    install -Dm644 "${srcdir}/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # DIRS
    install -d "${pkgdir}/opt/${pkgname}"

    # COPY SDK
    cd "${srcdir}/${pkgname}/"
    cp -a . "${pkgdir}/opt/${pkgname}/"
}