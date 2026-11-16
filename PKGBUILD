# Maintainer: Mike Pento <mjpento@gmail.com>

_pkgname=E17gtk
pkgname=gtk-theme-e17gtk-git
pkgver=V3.22.2.r1.gecebae2
pkgrel=3
pkgdesc="A dark GTK2/GTK3 theme with sharp corners, which is designed for use in Enlightenment and gives the elegant look of Enlightenment to GTK widgets."
arch=('any')
url="https://github.com/tsujan/${_pkgname}"
license=('GPL-3.0-only')
optdepends=('enlightenment' 'qt5-styleplugins: GTK+ rendering for QT5')
makedepends=('git')
options+=('!debug')
source=("git+https://github.com/tsujan/${_pkgname}")
md5sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    install -d "${pkgdir}/usr/share/themes"
    cp -a "${_pkgname}" "${pkgdir}/usr/share/themes/${_pkgname}"

    # remove .git folder from E17gtk.
    rm -r "${pkgdir}/usr/share/themes/${_pkgname}/.git"
}
