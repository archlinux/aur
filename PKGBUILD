# Maintainer: Matt Quintanilla <matt @ matt quintanilla . xyz>
_pkgname='devtoys'
pkgname="${_pkgname}-bin"
pkgver=2.0.1.0
pkgrel=1
_pkgver="${pkgver//_/-}"
_gitname="release-${_pkgver}"
pkgdesc="A Swiss Army knife for developers."
arch=('x86_64' 'aarch64')
url="https://github.com/DevToys-app/DevToys"
license=('MIT')
depends=(
    'webkitgtk-6.0'
)
provides=(${_pkgname})
conflicts=(${_pkgname})
source=(${_pkgname}.desktop)
source_x86_64=(https://github.com/DevToys-app/DevToys/releases/download/v"$pkgver"/devtoys_linux_x64.deb)
source_aarch64=(https://github.com/DevToys-app/DevToys/releases/download/v"$pkgver"/devtoys_linux_arm.deb)
package() {
    tar xf data.tar.zst -C "${pkgdir}"
    install -d "${pkgdir}/opt/${_pkgname}"
    cd ..

    rm "${pkgdir}/usr/share/applications/devtoys.desktop"
    install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    ln -sf "/opt/$_pkgname/$_pkgname" "${pkgdir}/usr/bin/$_pkgname"
}

sha256sums=('0c9daf652ca76bd6433572e431ac7bd0f20958e9c542e60f6389bd56936fedc1')
sha256sums_x86_64=('5cdf317b54b5a690ee9613c941c9b6ac1a811faf15e41466c492f4d36ff6f413')
sha256sums_aarch64=('9cdbcdefb6f19d31426cddec8f1ec796a02b64de2f5d6c41880b4a50195057d1')
