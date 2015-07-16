# Maintainer: ferk <ferkiwi @at gmail dot com>

pkgname=udev-media-automount
pkgver=24.7e62e0e
pkgrel=1
pkgdesc="Automatic mounting of removable devices in /media using simple udev rules"
arch=('any')
url="http://github.com/Ferk/udev-media-automount"
license=('GPL2')
depends=('bash' 'util-linux' 'systemd')
makedepends=('git')
conflicts=()
provides=()
source=("git://github.com/Ferk/udev-media-automount.git")
md5sums=('SKIP')

_gitroot="udev-media-automount"

pkgver () {
    cd "$srcdir/$_gitroot"
    echo "$(git rev-list --count HEAD).$(git describe --always)"
}

package() {
    cd "$srcdir/$_gitroot"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}

