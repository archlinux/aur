# Maintainer: Kyle De'Vir (QuartzDragon) <kyle[dot]devir[at]mykolab[dot]com>

pkgname=bcachefs-tools-git
pkgver=394
pkgrel=1
pkgdesc="bcachefs filesystem utilities"
url="https://evilpiepirate.org/git/bcachefs-tools.git/"
arch=("x86_64")
license=("GPL2")

provides=("bcachefs-tools")
makedepends=("git" "libscrypt" "libsodium" "attr" "libutil-linux" "keyutils" "pkgconf" "zlib" "liburcu")

source=("git+http://evilpiepirate.org/git/bcachefs-tools.git")
sha512sums=("SKIP")

pkgver() {
    cd bcachefs-tools

    echo $(git rev-list --count HEAD)
}

build() {
    cd bcachefs-tools

    make
}

package() {
    cd bcachefs-tools

    make DESTDIR="${pkgdir}" PREFIX="/usr" ROOT_SBINDIR="/usr/bin" INITRAMFS_DIR="/etc/initcpio" install
}
