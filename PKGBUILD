# Maintainer Hari Chalise <harilvfs@chalisehari.com.np>
pkgname="carch"
pkgver="v4.0.0"
pkgrel=1
pkgdesc="An automated script for quick & easy Arch Linux system setup"
arch=(any)
url="https://github.com/harilvfs/carch"
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
)

conflicts=('carch-git')
makedepends=()
source=("${pkgname}-${pkgver}::https://github.com/harilvfs/carch/archive/refs/tags/${pkgver}.tar.gz")
md5sums=('SKIP') 

package() {

    install -Dm 755 ${srcdir}/carch-${pkgver}/build/carch -t ${pkgdir}/usr/bin/carch
    
    install -d "$pkgdir/usr/bin/scripts"
    
    install -Dm 755 ${srcdir}/carch-${pkgver}/scripts/*.sh -t ${pkgdir}/usr/bin/scripts/

    # desktop entry
    install -Dm 644 ${srcdir}/carch-${pkgver}/carch.desktop -t ${pkgdir}/usr/share/applications/carch.desktop

    # license
    install -Dm 644 ${srcdir}/carch-${pkgver}/LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

    # doc
    install -Dm 644 ${srcdir}/carch-${pkgver}/README.md -t ${pkgdir}/usr/share/doc/${pkgname}/README.md

    # message
    echo
    echo ":: Carch ${pkgver} - Main Release"
    echo ":: ---------------------------------------------------"
    echo ":: Please execute the command carch once the installation is complete."
    echo
}


