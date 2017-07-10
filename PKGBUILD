# Maintainer: JannikHv <JannikHv@gmail.com>
pkgname=gamebox-gtk
pkgver=0.1.0
pkgrel=1
pkgdesc="Gamebox is a collection of minigames written in C using Gtk+-3.0"
arch=('i686' 'x86_64')
url="https://github.com/JannikHv/${pkgname}"
license=('GPL2')
depends=('gtk3')
makedepends=('git' 'gcc')
source=("${pkgname}"::"git://github.com/JannikHv/${pkgname}.git")
md5sums=('SKIP')

package() {
        cd "${srcdir}/${pkgname}"
        make
        install -Dm 0755 gamebox-gtk "${pkgdir}/usr/bin/gamebox-gtk"
        install -Dm 0644 gamebox-gtk.desktop "${pkgdir}/usr/share/applications/gamebox-gtk.desktop"
        install -Dm 0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
        install -Dm 0644 images/mill.png "${pkgdir}/usr/share/gamebox/images/mill.png"
}
