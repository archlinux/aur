# Maintainer: Dakeryas <mrdakeryas at gmail dot com>
pkgbase=deadbeef-dr-meter-git
pkgname=(deadbeef-dr-meter-gtk2-git deadbeef-dr-meter-gtk3-git)
pkgver=r403.d450cad
pkgrel=1
_pkgdesc="Dynamic Range meter plugin for the DeaDBeeF audio player"
pkgdesc="${_pkgdesc}"
arch=('i686' 'x86_64')
url="https://github.com/dakeryas/deadbeef-dr-meter"
license=('Apache')
makedepends=('git' 'pkg-config' 'deadbeef' 'gtk2' 'gtk3')
source=("git+https://github.com/dakeryas/deadbeef-dr-meter.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/deadbeef-dr-meter"
    echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package_deadbeef-dr-meter-gtk2-git() {
    pkgdesc="${_pkgdesc} GTK2"
    depends=('deadbeef' 'gtk2')
    provides=('deadbeef-dr-meter-gtk2')
    conflicts=('deadbeef-dr-meter-gtk3')
    cd "$srcdir/deadbeef-dr-meter"
    make DESTDIR="$pkgdir/" PREFIX=/usr/lib/deadbeef GTK=2 install
}

package_deadbeef-dr-meter-gtk3-git() {
    pkgdesc="${_pkgdesc} GTK3"
    depends=('deadbeef' 'gtk3')
    provides=('deadbeef-dr-meter-gtk3')
    conflicts=('deadbeef-dr-meter-gtk2')
    cd "$srcdir/deadbeef-dr-meter"
    make DESTDIR="$pkgdir/" PREFIX=/usr/lib/deadbeef GTK=3 install
}
