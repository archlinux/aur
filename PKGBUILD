# Maintainer: Arnau Camprubí <arnauxabia@gmail.com>
pkgname=hevi-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="A modern hex viewer"
arch=('x86_64' 'aarch64')
url="https://github.com/Arnau478/hevi"
license=('GPL3')
provides=('hevi')
source_x86_64=("hevi-x86_64-${pkgver}"::"https://github.com/Arnau478/hevi/releases/download/v${pkgver}/hevi-x86_64-linux")
source_aarch64=("hevi-x86_64-${pkgver}"::"https://github.com/Arnau478/hevi/releases/download/v${pkgver}/hevi-aarch64-linux")
sha256sums_x86_64=('faf22dc4cd43885e1fc49a4db8f8a725062934dc65b6115b4396486735a2b961')
sha256sums_aarch64=('faf22dc4cd43885e1fc49a4db8f8a725062934dc65b6115b4396486735a2b961')

package() {
    cd $srcdir

    if [ "${CARCH}" == "aarch64" ]; then
        install -Dm755 "hevi-aarch64-${pkgver}" "${pkgdir}/usr/bin/hevi"
    else
        install -Dm755 "hevi-x86_64-${pkgver}" "${pkgdir}/usr/bin/hevi"
    fi
}
