# Maintainer: pencelheimer <pencelheimer@proton.me>
pkgname=lget-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="A fast, interactive command-line tool to fetch open-source licenses directly from the SPDX repository."
arch=('x86_64')
url="https://github.com/pencelheimer/lget"
license=('MIT')
provides=('lget')
conflicts=('lget')

source=(
    "lget-${pkgver}::https://github.com/pencelheimer/lget/releases/download/v${pkgver}/lget-linux-x86_64"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/pencelheimer/lget/v${pkgver}/LICENSE"
)

sha256sums=('ba6e99529c0788e86eae88a27f320056a572add6fbc07f529c3ba56530d2b88f'
            'b05785f9f18e6716bab63424b11454513b9943a222595b70411009202fc592b5')

package() {
    install -Dm755 "${srcdir}/lget-${pkgver}" "${pkgdir}/usr/bin/lget"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
