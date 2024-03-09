# Maintainer: stefanwimmer128 <info at stefanwimmer128 dot xyz>

_pkgname=kf6-servicemenus-rootactions
pkgname=$_pkgname-git
pkgver=1.0.0.r0.g452676f
pkgrel=1
pkgdesc='Adds context menu entries for certain root only entries, authenticated though polkit.'
arch=(any)
url='https://codeberg.org/stefanwimmer128/kf6-servicemenus-rootactions'
license=(GPL-2.0-or-later)
depends=(dolphin kdialog perl polkit)
optdepends=(kate)
provides=($_pkgname)
conflicts=($_pkgname)
source=("$_pkgname::git+https://codeberg.org/stefanwimmer128/kf6-servicemenus-rootactions.git")
sha256sums=(SKIP)

pkgver() {
    cd "$_pkgname"
    git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "$_pkgname"

    make DESTDIR="$pkgdir" install
}
