# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=Dyan-Dev
_pkgname=loopi
pkgname=${_pkgname}-bin
pkgdesc="A visual automation builder that lets you create, schedule, and run automations with secure credential management"

pkgver=1.6.0
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
sha256sums_x86_64=('aebe28d2fb2b4f8367a9232f3365ec9293d6f083fe68772baa021c686cf91735')


package() {
    cd "${pkgdir}"

    # this extracts all into the pkgdir
    tar -xf "${srcdir}/data.tar.zst"

    # fix .desktop
    sed -i 's/Name=loopi/Name=Loopi/g' "./usr/share/applications/loopi.desktop"
}
