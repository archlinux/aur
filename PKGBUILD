# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=Dyan-Dev
_pkgname=loopi
pkgname=${_pkgname}-bin
pkgdesc="A visual automation builder that lets you create, schedule, and run automations with secure credential management"

pkgver=1.7.0
pkgrel=1
_pkgstr=${pkgver}
_pkgvername=v${pkgver}

arch=('x86_64')
_barch=('amd64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc' 'gcc-libs' 'glib2' 'libxfixes' 'libxdamage' 'nspr' 'dbus' 'expat' 'gtk3' 'libxrandr' 'libxext' 'libxcomposite' 'libxkbcommon' 'nss' 'libcups' 'mesa' 'systemd-libs' 'cairo' 'alsa-lib' 'pango' 'at-spi2-core' 'libx11' 'libxcb')

source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.deb::${url}/releases/download/${_pkgvername}/${_pkgname}_${_pkgstr}_${_barch[0]}.deb")
sha256sums_x86_64=('6512cb92b928d6c30c20d5ec5797e3be1a290a3db82f50df7f0743444a308532')


package() {
    cd "${pkgdir}"

    # this extracts all into the pkgdir
    tar -xf "${srcdir}/data.tar.zst"

    # fix .desktop
    sed -i 's/Name=loopi/Name=Loopi/g' "./usr/share/applications/loopi.desktop"
}
