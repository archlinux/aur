# Maintainer: stefanwimmer128 <info@stefanwimmer128.xyz>

_pkgname=kf6-servicemenus-rootactions
pkgname=$_pkgname-git
pkgver=1.0.0.r3.gc456a68
pkgrel=1
pkgdesc='Allows admin users to perform several root only actions from dolphin via polkit agent.'
arch=(any)
url='https://gitlab.com/stefanwimmer128/kf6-servicemenus-rootactions'
license=(GPL-2.0-or-later)
depends=(dolphin kdialog perl polkit)
makedepends=(git)
optdepends=(kate)
provides=($_pkgname)
conflicts=($_pkgname)
source=("$_pkgname::git+https://gitlab.com/stefanwimmer128/kf6-servicemenus-rootactions.git")
sha256sums=(SKIP)

pkgver() {
    cd "$_pkgname"
    git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "$_pkgname"

    make DESTDIR="$pkgdir" install
}
