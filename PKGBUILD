# Maintainer: Daniel Souza <aur at posix dot dev dot br>

pkgname=chainner-rpm
pkgver=0.16.1
pkgrel=2
pkgdesc='Node-based image processing and AI upscaling GUI'
arch=('x86_64')
license=('GPL3')
url="https://github.com/chaiNNer-org/chaiNNer/"
provides=('chainner')
options=('!emptydirs' '!strip')
depends=('libxcrypt-compat')
source=("https://github.com/chaiNNer-org/chaiNNer/releases/download/v${pkgver}/chaiNNer-${pkgver}-x64-linux-redhat.rpm")
sha512sums=('7560aefe6643c22ffa8bb69ced74c95cb87abf946e10e12bce851eefc282740b01fd990b12438272b122f71e7d085f3adc30c3f47d387d06804bc61313adeaad')

package() (
    mkdir -p "${pkgdir}/usr/bin/"
    mkdir -p "${pkgdir}/usr/lib/"
    mkdir -p "${pkgdir}/usr/share/"
    cp -r "${srcdir}/usr/bin/." "${pkgdir}/usr/bin/"
    cp -r "${srcdir}/usr/lib/${pkgname%-rpm}/." "${pkgdir}/usr/lib/${pkgname%-rpm}/"
    cp -r "${srcdir}/usr/share/." "${pkgdir}/usr/share/"
)
