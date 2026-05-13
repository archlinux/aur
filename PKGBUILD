# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=Dyan-Dev
_pkgname=loopi
pkgname=${_pkgname}-bin
pkgdesc="A visual automation builder that lets you create, schedule, and run automations with secure credential management"

pkgver=1.10.1
pkgrel=1
_pkgstr=1.10.0

arch=('x86_64')
_barch=('amd64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc' 'gcc-libs' 'glib2' 'libxfixes' 'libxdamage' 'nspr' 'dbus' 'expat' 'gtk3' 'libxrandr' 'libxext' 'libxcomposite' 'libxkbcommon' 'nss' 'libcups' 'mesa' 'systemd-libs' 'cairo' 'alsa-lib' 'pango' 'at-spi2-core' 'libx11' 'libxcb')

source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${_pkgname}_${_pkgstr}_${_barch[0]}.deb")
sha256sums_x86_64=('6fe418da1600e0aa14a9b284dd29a2d105712015ca1eb6fa8170088804953279')


package() {
    cd "${pkgdir}"

    # this extracts all into the pkgdir
    tar -xf "${srcdir}/data.tar.zst"

    # fix .desktop
    sed -i 's/Name=loopi/Name=Loopi/g' "./usr/share/applications/loopi.desktop"
}
