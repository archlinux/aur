# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgname=sshpilot
pkgname=${_pkgname}-bin
pkgver=4.3.9
pkgrel=1
pkgdesc="SSH connection manager with integrated terminal, tunneling, tabbed interface and scp upload support"
arch=('x86_64')
url="https://github.com/mfat/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/mfat/${_pkgname}/v${pkgver}"
license=('GPL-3.0')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glib2' 'gtk4' 'gdk-pixbuf2' 'libsecret' 'pango' 'graphene' 'vte4' 'libadwaita' 'python' 'python-paramiko' 'python-cairo' 'python-gobject' 'python-keyring' 'python-psutil')

options=(!strip)

source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}-${pkgrel}_all.deb")
sha512sums_x86_64=('5916a8daf673ff8ed6cb92b7d121cdfbf9060ca200b4bd11a0de2db23443f9920d374b1d868f094f1b1b2e1790af4eba6361561852ba59da0656160fcee71520')

package() {
    cd "${pkgdir}"

    # this extracts all into the pkgdir
    tar -xf "${srcdir}/data.tar.zst"
}
