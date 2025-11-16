# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgname=systemd-pilot
pkgname=${_pkgname}-bin
pkgver=3.0
pkgrel=1
pkgdesc="Desktop application for managing systemd services"
arch=('x86_64')
url="https://github.com/mfat/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/mfat/${_pkgname}/v${pkgver}"
license=('GPL-3.0')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('gtk3' 'glib2' 'pango' 'gtksourceview4' 'python' 'python-gobject' 'python-paramiko' 'python-rich' 'python-keyring')

options=(!strip)

source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}.0-${pkgrel}_all.deb")
sha512sums_x86_64=('10652ae88410f2a858049b13788c1438a0a842ad38da165e1e0c98c3b28079742c0e97d55a45a9632e6b2c6a4852ea3b7403667a434ec5aaa6d17b011b19008e')

package() {
    cd "${pkgdir}"

    # this extracts all into the pkgdir
    tar -xf "${srcdir}/data.tar.zst"
}
