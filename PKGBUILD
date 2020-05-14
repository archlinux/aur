# Maintainer: peippo <christoph.fink@gmail.com>

pkgname="linux-timemachine-git"
pkgdesc="Rsync-based OSX-like time machine for atomic and resumable local and remote backups"
url="https://github.com/cytopia/linux-timemachine"

pkgver=1.0
pkgrel=0

arch=("any")
license=("MIT")

makedepends=(
    "git"
)
depends=(
    "rsync"
)
optdepends=(
    "openssh: backup to remote (SCP) locations"
)

source=(
    "${pkgname}-${pkgver}::git+https://github.com/cytopia/linux-timemachine.git"
)
sha256sums=(
    "SKIP"
)

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/"

    install \
        -Dm755 \
        timemachine \
        "${pkgdir}/usr/bin/timemachine"

    install \
        -Dm644 \
        LICENSE.md \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
