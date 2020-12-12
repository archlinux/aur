# Maintainer: Kevin Del Castillo Ramirez <quebin31@gmail.com>
pkgname=gnome-shell-extension-pop-shell-bin
pkgdesc="Pop Shell - Tiling window management in Gnome (WIP, precompiled)"
pkgver=1.1.0
pkgrel=1
arch=(any)
url="https://github.com/pop-os/shell"
license=("GPLv3")
optdepends=('gnome-shell-extensions: native-window extension for improved window placement')
conflicts=("gnome-shell-extension-pop-shell")
depends=("gnome-shell")

_gitorg=pop-os
_gitname=shell
_file="${_gitorg}-${_gitname}-${pkgver}"
source=("${_file}.zip::https://github.com/${_gitorg}/${_gitname}/releases/download/${pkgver}/pop-shell@system76.com_${pkgver}.zip")
sha256sums=("8265f4c28292409510b37173e66d08d8f3e78bc0985671323ca3c414f562c019")

package() {
    mkdir -p "${pkgdir}/usr/share/gnome-shell/extensions/"
    rm "${srcdir}/${_file}.zip"
    cp -r "${srcdir}" "${pkgdir}/usr/share/gnome-shell/extensions/pop-shell@system76.com"
}
