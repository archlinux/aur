pkgname=wacom-utility-git
pkgver=20150614
pkgrel=1
pkgdesc="Graphical tablet configuration utility"
arch=('i686' 'x86_64')
url="http://github.com/lubosz/wacom-utility.git"
license=('GPL')
depends=('gtk2' 'python2' 'xf86-input-wacom' 'gksu')
source=(wacom-utility.desktop)
md5sums=('1d44b3571fd5e48b80b2dec5209fcf47')

_gitname="wacom-utility"
_gitroot="http://github.com/lubosz/$_gitname"

package() {
    cd ${srcdir}/
    git clone ${_gitroot}

    cd ${_gitname}
    mkdir -p "${pkgdir}"/usr/share/wacom-utility
    mkdir -p "${pkgdir}"/usr/share/applications
    cp -a ./* "${pkgdir}"/usr/share/wacom-utility
    install -Dm644 "${startdir}"/wacom-utility.desktop "${pkgdir}"/usr/share/applications/
}
