# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=arsfeld
_pkgname=reel
pkgname=${_pkgname}-bin
pkgver=0.7.8
pkgrel=1
_pkgvername=v${pkgver}
pkgdesc="A modern GTK frontend for Plex and other media servers"
arch=('x86_64')
_barch=('amd64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('GPL-3.0-or-later')

conflicts=("${_pkgname}")
provides=("${_pkgname}")
makedepends=('tar')
depends=('glibc' 'gcc-libs' 'glib2' 'dbus' 'pango' 'gtk4' 'openssl' 'mpv' 'libadwaita' 'gstreamer' 'hicolor-icon-theme')

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.deb::${url}/releases/download/${_pkgvername}/${_pkgname}-${pkgver}-${_barch[0]}.deb")
sha256sums=('22f5911a628a28ca6763dcd6b6a478cd4078b94613f38bce56cdb239dc2f0721'
            '89193daa3a25723e992e1ec3ba9ab4c1b6622e0644059f4138b232c097d98e0e')
sha256sums_x86_64=('2d449c4f33e96a5022d32a05fe6c263d4b9dad3439c060a93268f500ed534b36')

package() {
    cd "${pkgdir}"

    # this extracts all into the pkgdir
    tar -xf "${srcdir}/data.tar.xz"

    install -Dm644 "${srcdir}/README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
} 
