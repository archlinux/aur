# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>

_pkgname=nfancurve
pkgname=${_pkgname}
pkgver=018
pkgrel=1
pkgdesc="A small and lightweight Bash script for using a custom fan curve in Linux for NVIDIA GPUs"
arch=("any")
url="https://github.com/nan0s7/nfancurve"
license=("GPL3")

depends=("bash" "nvidia" "nvidia-settings" "procps")
conflicts=("${_pkgname}-git")

install=${_pkgname}.install
source=("${_pkgname}-${pkgver}::https://github.com/nan0s7/${_pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('2d04a1313c00d4f691f24f55e0681ef02c49bd346257efa6f5c194483f0ab7611bc533b5b42c8364ca8a6be0804bcb725c8f384f5069dc4b547279df785225ec')


package() {
    cd "${_pkgname}-${pkgver}"

    install -Dm755 "temp.sh" "$pkgdir/usr/bin/nfancurve"
    install -Dm644 "config" "$pkgdir/usr/share/doc/${_pkgname}/config.example"

    install -Dm644 "README.md" "$pkgdir/usr/share/doc/${_pkgname}/README.md"
    install -Dm644 "USAGE.md" "$pkgdir/usr/share/doc/${_pkgname}/USAGE.md"
    install -Dm644 "LICENCE" "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
}
