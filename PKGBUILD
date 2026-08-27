# Maintainer: Funami
# Maintainer: FichteFoll <fichtefoll2@googlemail.com>

pkgname=aegisub-dependency-control
pkgver=0.9.0
pkgrel=1
pkgdesc="Package manager for scripts for the Aegisub subtitle editor"
arch=('x86_64' 'aarch64')
url="https://github.com/TypesettingTools/DependencyControl"
license=('MIT')
depends=(
    'aegisub'
    'libcrypto.so'
    'libcurl.so>=1.1'
)
install="${pkgname}.install"

source=(
    "https://github.com/TypesettingTools/DependencyControl/releases/download/v${pkgver}/DependencyControl-v${pkgver}.zip"
    "https://github.com/TypesettingTools/DependencyControl/raw/refs/tags/v${pkgver}/LICENSE"
)
sha256sums=('816f7b53cccf6f4d8f52d239eb55e6ccb33159340da6b46dbcc62c5e25150fa8'
            'f21f633c596509e89b2baedfd657c8f1b8018954b06576590971684b210e91f8')

package() {
    cd "${srcdir}"
    install -D -m 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"

    install -d "${pkgdir}/usr/share/aegisub"
    cp -r automation "${pkgdir}/usr/share/aegisub/"
}
