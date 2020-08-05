# Maintainer: Ingo Meyer <i.meyer@fz-juelich.de>

pkgname="rdiff-backup-fs"
pkgver="1.0.0"
pkgrel="2"
pkgdesc="A FUSE filesystem for accessing rdiff-backup archives."
arch=("i686" "x86_64" "armv6h" "armv7h" "aarch64")
url="https://code.google.com/archive/p/rdiff-backup-fs"
license=("GPLv3")
depends=("fuse2")
makedepends=()
source=("https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/rdiff-backup-fs/rdiff-backup-fs-${pkgver}.tar.gz")
sha256sums=("f921121c33ec0ec72268566af5e9dd6a68ea289d014f6960c9a3489c2c870a15")

build() {
    cd "${srcdir}/${pkgname}-${pkgver}" || return
    ./configure --prefix=/usr && \
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}" || return
    make DESTDIR="${pkgdir}" install
}
