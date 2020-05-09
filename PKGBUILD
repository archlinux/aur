# Maintainer: LinusDierheimer <Linus@Dierheimer.de>

pkgname=bash-pipes
pkgver=1.3.0
pkgrel=1
pkgdesc="Pipes screensaver for bash"
arch=("any")
url="https://github.com/pipeseroni/pipes.sh"
license=("MIT")
depends=("bash")
source=("https://github.com/pipeseroni/pipes.sh/archive/v${pkgver}.tar.gz")
sha256sums=("532976dd8dc2d98330c45a8bcb6d7dc19e0b0e30bba8872dcce352361655a426")
package() {
    cd "${srcdir}/pipes.sh-${pkgver}"
    make DESTDIR="$pkgdir" PREFIX=/usr install

    #contain backwards compatibility with old aur versions
    ln -sf "/usr/bin/pipes.sh" "${pkgdir}/usr/bin/pipes"
    ln -sf "/usr/bin/pipes.sh" "${pkgdir}/usr/bin/bash-pipes"

    ln -sf "/usr/share/man/man6/pipes.sh.6.gz" "${pkgdir}/usr/share/man/man6/pipes.6.gz"
    ln -sf "/usr/share/man/man6/pipes.sh.6.gz" "${pkgdir}/usr/share/man/man6/bash-pipes.6.gz"
}
