pkgname=twenty-twenty-twenty
pkgver=1.0.0
pkgrel=1
pkgdesc="20-20-20 is a program that alerts every 20 minutes to look something at 20 feet away for 20 seconds, written in Golang."
arch=('x86_64')
makedepends=('go')
depends=('alsa-lib')
conflicts=('twenty-twenty-twenty-bin')
url="https://github.com/thiagokokada/twenty-twenty-twenty"
license=('MIT')
source=("https://github.com/thiagokokada/twenty-twenty-twenty/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
    cd twenty-twenty-twenty-${pkgver}
    go build
}

package() {
    install -Dm755 "${srcdir}/twenty-twenty-twenty-${pkgver}/twenty-twenty-twenty" "${pkgdir}/usr/bin/twenty-twenty-twenty"
    install -Dm644 "${srcdir}/twenty-twenty-twenty-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
