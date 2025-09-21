# Maintainer: Shengyu Zhang <la@archlinuxcn.org>

pkgname=chezetc-git
_pkgname=${pkgname%-git}
pkgver=202509.5.1.geeeae5c
pkgrel=1
pkgdesc='Extending chezmoi to manage files under /etc and other root-owned directories'
arch=(any)
url='https://silverrainz.me/chezetc'
license=(MIT)
depends=(bash gettext python python-tomli python-tomli-w)
conflicts=($_pkgname)
provides=($_pkgname)
source=("git+https://github.com/SilverRainZ/chezetc.git#branch=master")
sha256sums=('SKIP')

pkgver() {
    cd $_pkgname
    git describe --tags | sed 's/-/./g'
}

package() {
    cd $_pkgname
    DESTDIR=$pkgdir ./utils/install.sh
}

# vim: set filetype=sh:
