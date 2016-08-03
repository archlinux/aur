# Maintainer icasdri <icasdri at gmail dot com>

_pkgname=elegance-orange
pkgname=gnome-shell-theme-${_pkgname}-git
pkgver=10
pkgrel=3
pkgdesc="A static orange shell theme based on Elegance Colors"
arch=(any)
url="https://github.com/NOSDuco/elegance-orange"
license=('GPLv3')
depends=('gnome-shell')
makedepends=('git')
optdepends=('gnome-tweak-tool: user interface to theme selection and other GNOME Shell options')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git rev-list --count HEAD
}

package() {
    cd "${srcdir}/${_pkgname}"
    mkdir -p "${pkgdir}/usr/share/themes"
    cp -r 'elegance-orange' "${pkgdir}/usr/share/themes"
}
