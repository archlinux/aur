# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname=picocrypt-bin
basename=Picocrypt
pkgver=1.41
pkgrel=1
pkgdesc="A very small, very simple, yet very secure encryption tool."
arch=('x86_64')
url="https://github.com/Picocrypt/Picocrypt"
license=('GPL3')
makedepends=('tar')
conflicts=('picocrypt')
provides=('picocrypt')
depends=('gtk3')
source=("https://github.com/${basename}/${basename}/releases/download/${pkgver}/${basename}.deb")
sha256sums=('7bacdf322705e1ba63079485e05988c27a8e995beb546c70e35d2d96367efab3')

package() {
    cd "${pkgdir}"
    # this extracts all into the pkgdir
    tar xf "${srcdir}/data.tar.xz"
    mv "${pkgdir}/usr/bin/picocrypt-gui" "${pkgdir}/usr/bin/picocrypt"
    ln -sf "${pkgdir}/usr/bin/picocrypt" "${pkgdir}/usr/bin/picocrypt-gui"
} 
