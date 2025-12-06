# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

# https://github.com///releases/download/v1.0.0/loopi_1.0.0_amd64.deb
_pkgauthor=Dyan-Dev
_pkgname=loopi
pkgname=${_pkgname}-bin
pkgdesc="A visual automation builder that lets you create, schedule, and run automations with secure credential management"

pkgver=1.0.0
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64')
_barch=('amd64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc' 'gcc-libs' 'glib2' 'libxfixes' 'libxdamage' 'nspr' 'dbus' 'expat' 'gtk3' 'libxrandr' 'libxext' 'libxcomposite' 'libxkbcommon' 'nss' 'libcups' 'mesa' 'systemd-libs' 'cairo' 'alsa-lib' 'pango' 'at-spi2-core' 'libx11' 'libxcb')

# source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
#         "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.deb::${url}/releases/download/${_pkgvername}/${_pkgname}_${pkgver}_${_barch[0]}.deb")
sha256sums_x86_64=('f675119f2cc97a8486f21536df240e573038162974f0fd6b0713086f88111a67')



package() {
    cd "${pkgdir}"

    # this extracts all into the pkgdir
    tar -xf "${srcdir}/data.tar.zst"

    # fix .desktop
    sed -i 's/Name=loopi/Name=Loopi/g' "./usr/share/applications/loopi.desktop"
}
