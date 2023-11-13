# Maintainer: nroi <nroi@mailbox.org>
_appname='audiowarden'
pkgname="${_appname}-bin"
pkgver=0.1.2
pkgrel=1
epoch=
pkgdesc="Skip spotify songs you don't like"
arch=('x86_64')
url="https://github.com/nroi/audiowarden"
license=('MIT')
depends=()
provides=("${_appname}")
conflicts=("${_appname}")
source=('audiowarden.service')
source_x86_64+=("https://github.com/nroi/${_appname}/releases/download/${pkgver}/${_appname}-x86.tar.gz")
sha256sums=('a8789704183f5bb551807fff056935c047ddf6c0a72eeb0047ee0ceb4777f3cb')
sha256sums_x86_64+=('90396e41ba5bfbe068d8cd6441ae0816d79c68ea1215a3aced7d19794d4a5a8c')

package() {
    install -Dm644 "${srcdir}/audiowarden.service" "${pkgdir}/usr/lib/systemd/user/audiowarden.service"
    cd audiowarden-x86
    install -Dm755 audiowarden "${pkgdir}/usr/bin/audiowarden"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_appname}/LICENSE"
}
