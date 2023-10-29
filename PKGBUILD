# Maintainer: nroi <nroi@mailbox.org>
pkgname=audiowarden
pkgver=0.1.0
pkgrel=1
epoch=
pkgdesc="Skip spotify songs you don't like"
arch=('x86_64')
url="https://github.com/nroi/audiowarden"
license=('MIT')
depends=()
source=('audiowarden.service')
source_x86_64+=("https://github.com/nroi/${pkgname}/releases/download/${pkgver}/${pkgname}-x86.tar.gz")
sha256sums=('a8789704183f5bb551807fff056935c047ddf6c0a72eeb0047ee0ceb4777f3cb')
sha256sums_x86_64+=('fae860c20ead431d43af1e46c2a83526acce09ec2e5c365675574ee1b8865506')

package() {
    install -Dm644 "${srcdir}/audiowarden.service" "${pkgdir}/usr/lib/systemd/user/audiowarden.service"
    cd audiowarden-x86
    install -Dm755 audiowarden "${pkgdir}/usr/bin/audiowarden"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
