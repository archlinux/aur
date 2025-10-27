# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=arsfeld
_pkgname=reel
pkgname=${_pkgname}-bin
pkgver=0.7.6
pkgrel=1
_pkgvername=v${pkgver}
pkgdesc="A modern GTK frontend for Plex and other media servers"
arch=('x86_64' 'aarch64')
_barch=('amd64' 'arm64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('GPL-3.0-or-later')

conflicts=("${_pkgname}")
provides=("${_pkgname}")
makedepends=('tar')
depends=('glibc' 'gcc-libs' 'glib2' 'dbus' 'pango' 'gtk4' 'openssl' 'mpv' 'libadwaita' 'gstreamer' 'hicolor-icon-theme')

source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.deb::${url}/releases/download/${_pkgvername}/${_pkgname}-${pkgver}-${_barch[0]}.deb")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.deb::${url}/releases/download/${_pkgvername}/${_pkgname}-${pkgver}-${_barch[1]}.deb")
sha256sums_x86_64=('61e0cf24d4d7bd123b7430eff999c66b0af80fe2876f9e34e6ae2fb6a8384e49')
sha256sums_aarch64=('5a7ee76aec4886db0167b27d86feee6098c6e054100af69bd8ca4564e6b4acb3')

package() {
    cd "${pkgdir}"

    # this extracts all into the pkgdir
    tar -xf "${srcdir}/data.tar.xz"
} 
