# Maintainer: JannikHv <JannikHv@gmail.com>
pkgname=gamebox-git
pkgver=0.1.0
pkgrel=1
pkgdesc="Gamebox is a collection of minigames written in C using Gtk+-3.0"
arch=('i686' 'x86_64')
url="https://github.com/JannikHv/gamebox"
license=('GPL2')
depends=('gtk3')
makedepends=('git' 'gcc')
source=("${pkgname}"::"git://github.com/JannikHv/gamebox.git")
md5sums=('SKIP')

package() {
        cd "${srcdir}/${pkgname}"
        make
        install -Dm 0755 gamebox "${pkgdir}/usr/bin/gamebox"
        install -Dm 0644 gamebox.desktop "${pkgdir}/usr/share/applications/gamebox.desktop"
        install -Dm 0644 LICENSE "${pkgdir}/usr/share/licenses/gamebox/LICENSE"
        install -Dm 0644 images/mill.png "${pkgdir}/usr/share/gamebox/images/mill.png"
}
