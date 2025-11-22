# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgname=sshpilot
pkgname=${_pkgname}-bin
pkgver=4.4.2
pkgrel=1
pkgdesc="SSH connection manager with integrated terminal, tunneling, tabbed interface and scp upload support."
arch=('x86_64')
url="https://github.com/mfat/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/mfat/${_pkgname}/v${pkgver}"
license=('GPL-3.0')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glib2' 'gtk4' 'gdk-pixbuf2' 'libsecret' 'pango' 'graphene' 'vte4' 'libadwaita' 'python' 'python-paramiko' 'python-cairo' 'python-gobject' 'python-keyring' 'python-psutil')

options=(!strip)

source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}-${pkgrel}_all.deb")
sha512sums_x86_64=('676636c1c4a6e420c723ab94cf1fe6ff0a1a88c403c9eb8de23da2fd46042b89f057cd65b51cc8aba4d72c005e30c8d9028a761e9e46878e6e1e2a3d3c256ea3')

package() {
    cd "${pkgdir}"

    # this extracts all into the pkgdir
    tar -xf "${srcdir}/data.tar.zst"
}
