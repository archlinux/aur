# Maintainer: Yus314 <https://github.com/Yus314>
pkgname=kasane-bin
pkgver=0.1.1
pkgrel=1
pkgdesc='Alternative frontend for the Kakoune text editor (prebuilt binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/Yus314/kasane'
license=('MIT' 'Apache-2.0')
depends=('kakoune>=2024.12.09')
provides=('kasane')
conflicts=('kasane')

source=("LICENSE-MIT::https://raw.githubusercontent.com/Yus314/kasane/v${pkgver}/LICENSE-MIT"
        "LICENSE-APACHE::https://raw.githubusercontent.com/Yus314/kasane/v${pkgver}/LICENSE-APACHE")
sha256sums=('7df959e3ed3c0ceeec7e83bfebd6fa4f81b62d36618f2aacdd97331c2c38369a'
            '1263c7c3105ecd7de4af8c5535c4c563d0973e5f6d175d353bceba720b31ebf1')

source_x86_64=("kasane-v${pkgver}-x86_64-linux-gnu.tar.gz::https://github.com/Yus314/kasane/releases/download/v${pkgver}/kasane-v${pkgver}-x86_64-linux-gnu.tar.gz")
sha256sums_x86_64=('f66d4bf00cb6285293be73abc305e0392595e89bbf8fde942b4d3c3eb86a8990')

source_aarch64=("kasane-v${pkgver}-aarch64-linux-gnu.tar.gz::https://github.com/Yus314/kasane/releases/download/v${pkgver}/kasane-v${pkgver}-aarch64-linux-gnu.tar.gz")
sha256sums_aarch64=('df27267c123b613d655f564378c37ecbfd892408825407637c3dd5a1dbd7620a')

package() {
    install -Dm755 kasane "${pkgdir}/usr/bin/kasane"
    install -Dm644 LICENSE-MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
    install -Dm644 LICENSE-APACHE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
}
