# Maintainer: Brenton Horne <brentonhorne77 at gmail dot com>
pkgname=osx-arc-white-git
_pkgname=OSX-Arc-White
pkgver=212d022
pkgrel=1
pkgdesc="OSX-Arc-White Theme for Cinnamon, GNOME, Unity, Xfce and GTK+"
arch=(any)
license=('GPL3')
url="https://github.com/fusion809/${_pkgname}"
depends=('gtk3' 'gtk2')
optdepends=('gnome-shell' 'cinnamon')
makedepends=('git')
source=("git+${url}.git")
md5sums=('SKIP')

pkgver () {
    cd $srcdir/$_pkgname
    git rev-parse --short=7 HEAD
}

package(){
    cd "$srcdir/$_pkgname"
    install -dm644 "$pkgdir/usr/share/themes/${_pkgname}/"
    cp -r */ "$pkgdir/usr/share/themes/${_pkgname}/"
    chmod +x "$pkgdir/usr/share/themes/OSX-Arc-White"
}
