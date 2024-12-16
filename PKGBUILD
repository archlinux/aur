# Maintainer: peippo <christoph.fink@gmail.com>

pkgname="linux-timemachine"
pkgdesc="Rsync-based OSX-like time machine for atomic and resumable local and remote backups"
url="https://github.com/cytopia/linux-timemachine"

pkgver=1.3.2
pkgrel=1

arch=("any")
license=("MIT")

makedepends=("git")
depends=("rsync")
optdepends=("openssh: backup to remote (SCP) locations")

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=("937335d9fc7c41cdc691be09df1b5daf732ba52dc567efdd7b141907459045efd599088c9297a9d5ea706b9416deb9d1a11f8df1b91f446665bb39484ea8d6c8")

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    install \
        -Dm755 \
        timemachine \
        "${pkgdir}/usr/bin/timemachine"

    install \
        -Dm644 \
        LICENSE.md \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
