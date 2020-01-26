# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Christian Münch <christian@muench-worms.de>
pkgname=pacman-auto-update
pkgver=1.0.0
pkgrel=1
pkgdesc="Install a systemd service triggered by a timer to run automatic pacman package updates"
arch=('i686' 'x86_64')
url="https://github.com/cmuench/pacman-auto-update.git"
license=('GPL')
install=${pkgname}.install
changelog=
depends=(systemd)
source=("${pkgname}.service"
        "${pkgname}.timer")
md5sums=('8813d126331d900ab7368bcab156b56d'
         'e68d3424ad02a8a78de4fae56945f09f')

#build() {
#    mkdir -p usr/lib/systemd/system
#    mv ${pkgname}.service usr/lib/systemd/system
#    mv ${pkgname}.timer usr/lib/systemd/system
#}

package() {
    install -d -m755 "$pkgdir/usr/lib/systemd/system"
    install -m644 ${pkgname}.service "$pkgdir/usr/lib/systemd/system/"
    install -m644 ${pkgname}.timer "$pkgdir/usr/lib/systemd/system/"
    #ln -s ${pkgname}.service ${pkgdir}/usr/lib/systemd/system/${pkgname}.service
    #ln -s ${pkgname}.timer ${pkgdir}/usr/lib/systemd/system/${pkgname}.timer
}
