# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_basename=Athas
pkgname=${_basename,,}-bin
pkgver=0.4.7
pkgrel=1
pkgdesc="Lightweight code editor built with React, TypeScript, and Tauri"
arch=('x86_64')
_barch=('amd64')
url="https://github.com/athasdev/athas"
license=('AGPL-3.0-or-later')
conflicts=("${_basename}")
provides=("${_basename}")
makedepends=('tar')
depends=('glibc' 'gcc-libs' 'zlib' 'gdk-pixbuf2' 'libsoup3' 'xz' 'cairo' 'gtk3' 'glib2' 'webkit2gtk-4.1' 'hicolor-icon-theme')
source_x86_64=("${url}/releases/download/v${pkgver}/${_basename}_${pkgver}_${_barch[0]}.deb")
sha256sums_x86_64=('c7502a7fe61acf4d2afcf80147f284b9af6d3bb253878cba5dd0bf2915f1bdfe')

package() {
    cd "${pkgdir}"

    msg2 "Extracts all into the ${pkgdir}"
    tar -xf "${srcdir}/data.tar.gz"

    msg2 "Fix .desktop file"
    sed -i -e 's/Categories=/Categories=TextEditor;Development;IDE;/g' "./usr/share/applications/Athas.desktop"
} 
