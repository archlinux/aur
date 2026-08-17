# Maintainter: Ben Song <bensongsyz@gmail.com>
pkgname="pacman-archive"
pkgver=0.3.0
pkgrel=2
pkgdesc="This package will append proper archive url to mirrorlist"
arch=('x86_64')
license=('GPL')
source=(
    pacman-archive
    update-mirrorlist-archive
    update-mirrorlist-archive.hook
    pacman-archive.toml
    README.md
)
sha256sums=(
    e6ce7bc1412cec6f7f111c1080e01f4d9c16e9968fe16b4f49ffbac519334231
    77860d83f795f2fcf933bc561020c19265925028a8da317be90f97762fcbd7f8
    9a3942d62968249c951f4a1a65b0514bd72459655502ffd9f16098f9304767a4
    997acd67ae1ae270c9fc69e7e777afe0d8710c1fea30e1ea1ef35da983d0b2f1
    SKIP
)

backup=(etc/pacman.d/hooks/update-mirrorlist-archive.hook)
backup+=(etc/pacman-archive.toml)
package(){
    install -D --mode=755 --target-directory="${pkgdir}/usr/bin" "$srcdir"/pacman-archive
    install -D --mode=755 --target-directory="${pkgdir}/usr/bin" "$srcdir"/update-mirrorlist-archive

    install -D --mode=644 --target-directory="${pkgdir}/etc/pacman.d/hooks/" "$srcdir"/update-mirrorlist-archive.hook
    install -D --mode=644 --target-directory="${pkgdir}/etc/" "$srcdir"/pacman-archive.toml

    install -D --mode=644 --target-directory="${pkgdir}/usr/share/doc/pacman-archive/" "$srcdir"/README.md

    install -d --mode=755 "${pkgdir}/var/lib/pacman-archive"
}

install="$pkgname".install
