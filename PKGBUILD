# Maintainer: Orestis Floros <orestisf1993@gmail.com>

pkgname=gtk-arc-flatabulous-theme-git
_pkgname=arc-flatabulous-theme
pkgver=528.e278c1f
pkgrel=1
pkgdesc="Arc theme with Flatabulous window controls."
arch=('any')
url="https://github.com/andreisergiu98/${_pkgname}"
license=('GPL3')
depends=('gtk3' 'gtk-engine-murrine' 'gnome-themes-standard')
makedepends=('git' 'autoconf' 'automake' 'pkg-config' )
source=(${_pkgname}::"git+${url}")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_pkgname}"
    ./autogen.sh --prefix=/usr
}

package() {
    make -C "${srcdir}/${_pkgname}" DESTDIR="${pkgdir}" install
}
