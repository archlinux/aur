# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgtitle=AltSendme
_pkgauthor=tonyantony300
_pkgname=alt-sendme
pkgname=${_pkgname}-bin
pkgver=0.6.0
pkgrel=1
pkgdesc='Frictionless, real-time file transfer tool'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64')
_barch=('amd64')
license=('AGPL-3.0')

depends=('glibc' 'glib2' 'gcc-libs' 'cairo' 'hicolor-icon-theme' 'webkit2gtk-4.1' 'gdk-pixbuf2' 'libsoup3' 'gtk3')
makedepends=('tar')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

options=('!strip')
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgtitle}_${pkgver}_${_barch[0]}.deb")
sha256sums_x86_64=('7366f7d32afbed44ef9df079c5303fa67c1049c83ebbeba54e88c379b587ea64')


package() {
    cd "${pkgdir}"

    # this extracts all into the pkgdir
    tar -xf "${srcdir}/data.tar.zst"

    sed -i "usr/share/applications/${_pkgtitle}.desktop" \
        -e "s|Categories=|Categories=GTK;FileTransfer;Utility;|"
}
