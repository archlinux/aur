# Maintainer: Daniel Souza <aur at posix dot dev dot br>

pkgname=chainner-rpm
pkgver=0.17.1
pkgrel=1
pkgdesc='Node-based image processing and AI upscaling GUI'
arch=('x86_64')
license=('GPL3')
url="https://github.com/chaiNNer-org/chaiNNer/"
provides=('chainner')
options=('!emptydirs' '!strip')
depends=('libxcrypt-compat')
source=("https://github.com/chaiNNer-org/chaiNNer/releases/download/v${pkgver}/chaiNNer-${pkgver}-x64-linux-redhat.rpm")
sha512sums=('4b32d049bc2468062db574dc4cbcd144e9cd006d59f0e35f267cf077274e5a74bc70d3512d8d17eb93c5b9b0b7f52bce91a355c910ea78934e271dfacfff1338')

package() (
    mkdir -p "${pkgdir}/usr/bin/"
    mkdir -p "${pkgdir}/usr/lib/"
    mkdir -p "${pkgdir}/usr/share/"
    cp -r "${srcdir}/usr/bin/." "${pkgdir}/usr/bin/"
    cp -r "${srcdir}/usr/lib/${pkgname%-rpm}/." "${pkgdir}/usr/lib/${pkgname%-rpm}/"
    cp -r "${srcdir}/usr/share/." "${pkgdir}/usr/share/"
)
