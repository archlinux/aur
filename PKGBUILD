# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=arsfeld
_pkgname=reel
pkgname=${_pkgname}-bin
pkgver=0.7.4
pkgrel=1
_pkgvername=v${pkgver}
pkgdesc="A modern GTK frontend for Plex and other media servers"
arch=('x86_64' 'aarch64')
_barch=('amd64' 'arm64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=('GPL-3.0-or-later')

conflicts=("${_pkgname}")
provides=("${_pkgname}")
makedepends=('tar')
depends=('glibc' 'gcc-libs' 'glib2' 'dbus' 'pango' 'gtk4' 'openssl' 'mpv' 'libadwaita' 'gstreamer' 'hicolor-icon-theme')

source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.deb::${url}/releases/download/${_pkgvername}/${_pkgname}-${pkgver}-${_barch[0]}.deb")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.deb::${url}/releases/download/${_pkgvername}/${_pkgname}-${pkgver}-${_barch[1]}.deb")
sha256sums_x86_64=('d1117d5c82fd4c393f9a660ff93666924b29b4eba5796e1254121b6c53a5a382')
sha256sums_aarch64=('c55d34daa378ccbc5cd48eea8d4219726d275420cf2851164566833fe65b5975')

package() {
    cd "${pkgdir}"

    # this extracts all into the pkgdir
    tar -xf "${srcdir}/data.tar.xz"
} 
