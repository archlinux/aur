# Maintainter: Ben Song <bensongsyz@gmail.com>
pkgname="pacman-archive"
pkgver=0.2.0
pkgrel=1
pkgdesc="This package will append proper archive url to mirrorlist"
arch=('x86_64')
license=('GPL')
source=(
    pacman-archive
    update-mirrorlist-archive
    update-mirrorlist-archive.hook
)
sha256sums=(
    e6ce7bc1412cec6f7f111c1080e01f4d9c16e9968fe16b4f49ffbac519334231
    55ff86e2ce4caa43e16e640070621710e5e5e5808e4cfd13a0fe7e59c17732f3
    e65fec57db3e938f278aafbda1114b2428389c4ba4860f53864e9e41d5f7aab5
)

backup=(etc/pacman.d/hooks/update-mirrorlist-archive.hook)
package(){
    install -D --mode=755 --target-directory="${pkgdir}/usr/bin" "$srcdir"/pacman-archive
    install -D --mode=755 --target-directory="${pkgdir}/usr/bin" "$srcdir"/update-mirrorlist-archive

    install -D --mode=644 --target-directory="${pkgdir}/etc/pacman.d/hooks/" "$srcdir"/update-mirrorlist-archive.hook
}

install="$pkgname".install
