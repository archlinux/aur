# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=stylesheet-gtk-theme
_pkgname=stylesheet
pkgdesc="The GTK Stylesheet (them) from elementary OS"
pkgver=6.0.0
pkgrel=1
arch=('any')
url="https://github.com/elementary/stylesheet/tags"
license=('GPL3')
makedepends=('meson' 'sassc' 'git')
validpgpkeys=("5DE3E0509C47EA3CF04A42D34AEE18F83AFDEB23")
# FIXME: For some reason verifying the GPG signature fails.
# source=("git+https://github.com/elementary/stylesheet.git?signed#tag=$pkgver")
source=("git+https://github.com/elementary/stylesheet.git#tag=$pkgver")
sha512sums=('SKIP')

build() {
    cd ${_pkgname}
    meson build --prefix=/usr
}

package() {
    cd ${_pkgname}/build

    DESTDIR="$pkgdir" ninja install
}
