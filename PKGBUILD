# Maintainer: Hari Chalise <harilvfs@chalisehari.com.np>
pkgname="carch"
pkgver="v4.1.0"
pkgrel=1
pkgdesc="An automated script for quick & easy Arch Linux system setup"
arch=(any)
url="https://github.com/harilvfs/$pkgname"
license=('GPL')
options=(!strip)
depends=(
    "bash"
    "man-pages"
    "zip"
    "gum"
    "git"
    "sed"
    "xdg-user-dirs"
    "wget"
    "figlet"
    "pacman"
    "unzip"
    "python"
    "gtk3"
    "noto-fonts-emoji"
    "ttf-joypixels"
    "curl"
    "tar"
)
conflicts=('carch-git')
makedepends=()
source=("${pkgname}-${pkgver}::https://github.com/harilvfs/carch/archive/refs/tags/${pkgver}.tar.gz")
md5sums=('SKIP')

package() {
    
    install -dm 755 ${pkgdir}/usr/bin/scripts
    cp -r ${srcdir}/carch-${pkgver}/scripts/. ${pkgdir}/usr/bin/scripts

    install -Dm 755 ${srcdir}/carch-${pkgver}/build/carch ${pkgdir}/usr/bin/carch
    
    install -Dm 755  ${srcdir}/carch-${pkgver}/gtk/carch-gtk.py ${pkgdir}/usr/bin/carch-gtk
    
    # license
    install -Dm 755 ${srcdir}/carch-${pkgver}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

    # doc
    install -Dm 755 ${srcdir}/carch-${pkgver}/README.md ${pkgdir}/usr/share/doc/${pkgname}/README.md
    
    install -Dm 755 ${srcdir}/carch-${pkgver}/carch.desktop ${pkgdir}/usr/share/applications/carch.desktop

    install -Dm 755 ${srcdir}/carch-${pkgver}/man/carch.1 ${pkgdir}/usr/share/man/man.1/carch.1

}
