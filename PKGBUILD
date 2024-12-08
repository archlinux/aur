# Maintainer: Hari Chalise <harilvfs@chalisehari.com.np>
pkgname=carch-git
_pkgname=carch
pkgver=v3.0.9.r27.g8e8e38b
pkgrel=1
pkgdesc="An automated script for quick & easy Arch Linux system setup"
arch=(any)
url="https://github.com/harilvfs/$_pkgname"
license=('GPL')
options=(!strip)
depends=('bash' 'gum' 'figlet' 'pacman' 'unzip' 'python' 'gtk3')
source=("${pkgname}::git+https://github.com/harilvfs/$_pkgname.git")
md5sums=('SKIP')

conflicts=($_pkgname)
makedepends=(git)

pkgver() {

    #version
    cd "$pkgname"
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'

}

package() {

    # bin
    install -Dm 755 ${srcdir}/${pkgname}/build/core.sh ${pkgdir}/usr/bin/carch
    install -d "$pkgdir/usr/bin/scripts"
    install -Dm 755 ${srcdir}/${pkgname}/scripts/*.sh -t ${pkgdir}/usr/bin/scripts/

    # license
    install -Dm 755 ${srcdir}/${pkgname}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

    # doc
    install -Dm 755 ${srcdir}/${pkgname}/README.md ${pkgdir}/usr/share/doc/${pkgname}/README.md



}

