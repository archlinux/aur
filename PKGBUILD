# Maintainer: HelloImWar <helloimwar at proton dot me>

pkgname=gnome-shell-theme-dracula-git
_pkgname=${pkgname%-git}
pkgver=293.b64d36a
pkgrel=1
pkgdesc='Dracula theme for GNOME Shell'
arch=('any')
url='https://github.com/dracula/gtk'
license=('GPL')
makedepends=(git)
source=("${_pkgname}::git+$url.git")
sha256sums=('SKIP')
provides=(${_pkgname})
conflicts=(${_pkgname})

pkgver() {
    cd "${srcdir}/${_pkgname}"
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
    cd "${srcdir}/${_pkgname}"

    mkdir -p "${pkgdir}/usr/share/themes/Dracula-shell-v40"
    cp -a "${srcdir}/${_pkgname}/gnome-shell" "${pkgdir}/usr/share/themes/Dracula-shell-v40/"
    cp -a "${srcdir}/${_pkgname}/gnome-shell/v40/gnome-shell.css" "${pkgdir}/usr/share/themes/Dracula-shell-v40/gnome-shell/"
}
