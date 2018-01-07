# Maintainer: Joaquin Garmendia <joaquingc123@gmail.com>
# Contributor: Orestis Floros <orestisf1993@gmail.com>

pkgname=gtk-arc-flatabulous-theme-git
_pkgname=arc-flatabulous-theme
pkgver=709.1b1b7c9
pkgrel=1
pkgdesc="Arc theme with Flatabulous window controls."
arch=('any')
url="https://github.com/andreisergiu98/${_pkgname}"
license=('GPL3')
makedepends=('git' 'gtk3')
optdepends=('gtk-engine-murrine: for gtk2 themes'
            'gnome-themes-standard: for gtk2 themes'
	    'arc-icon-theme: recommended icon theme')
source=("${_pkgname}"::"git+${url}")
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
    cd "${srcdir}/${_pkgname}"
    make DESTDIR="${pkgdir}" install
}
