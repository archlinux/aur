# Maintainer: Karol Babioch <karol@babioch.de

pkgname=snapback-git
pkgver=1.r0.aff9eeb
pkgrel=1
pkgdesc="Set of scripts to glue together snapshot capabilities from btrfs and backup solutions from borg in a reliable and automated way."
arch=('any')
url="https://github.com/kbabioch/snapback/"
license=('GPL3')
depends=('btrfs-progs' 'borg')
makedepends=('git')
provides=('snapback')
conflicts=('snapback')
backup=('etc/conf.d/snapback')
source=('git+https://github.com/kbabioch/snapback.git')
sha256sums=('SKIP')

pkgver() {

    cd "$srcdir/snapback"
    git describe --long | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'

}

build() {

    #make
    :

}

package() {

    cd "$srcdir/snapback"
    make DESTDIR="$pkgdir/" install

}

