# Maintainer: Daniel Souza <aur at posix dot dev dot br>

pkgname=chainner-rpm
pkgver=0.17.0
pkgrel=1
pkgdesc='Node-based image processing and AI upscaling GUI'
arch=('x86_64')
license=('GPL3')
url="https://github.com/chaiNNer-org/chaiNNer/"
provides=('chainner')
options=('!emptydirs' '!strip')
depends=('libxcrypt-compat')
source=("https://github.com/chaiNNer-org/chaiNNer/releases/download/v${pkgver}/chaiNNer-${pkgver}-x64-linux-redhat.rpm")
sha512sums=('59d7a8a8c5c1af7cc549c7d844a479055e6b79db80cda1a1f1412460f6ace9d4b4e29cc328e2f29868c87a4a4f1b89325ba2986f40a7da0bcdbc84c567f9b669')

package() (
    mkdir -p "${pkgdir}/usr/bin/"
    mkdir -p "${pkgdir}/usr/lib/"
    mkdir -p "${pkgdir}/usr/share/"
    cp -r "${srcdir}/usr/bin/." "${pkgdir}/usr/bin/"
    cp -r "${srcdir}/usr/lib/${pkgname%-rpm}/." "${pkgdir}/usr/lib/${pkgname%-rpm}/"
    cp -r "${srcdir}/usr/share/." "${pkgdir}/usr/share/"
)
