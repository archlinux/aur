# Maintainer: Shyamin Ayesh <me@shyamin.com>

pkgname=flutter-sdk
pkgver=1.17.5
pkgrel=1
arch=("x86_64")
license=("BSD")
pkgdesc="Flutter SDK"
url="https://github.com/flutter/flutter"
source=(
    "${url}/archive/${pkgver}.tar.gz"
    "${pkgname}.sh"
)
sha256sums=(
    "987e4232848661402dc6001c374c454649ef04a783aaff13512f86cf4018fb9c"
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