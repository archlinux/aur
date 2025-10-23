# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: klpod221 <klpod221@gmail.com>

_pkgauthor=klpod221
_pkgname=kerminal
pkgname=${_pkgname}-bin
pkgver=2.0.0
_pkgvername=v${pkgver}
pkgrel=1
pkgdesc="Modern terminal app with SSH/SFTP support"
arch=('x86_64')
_barch=('amd64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('MIT')

depends=('glibc' 'gcc-libs' 'glib2' 'gtk3' 'cairo' 'webkit2gtk-4.1' 'libsoup3' 'gdk-pixbuf2' 'hicolor-icon-theme')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

install="${pkgname}.install"
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.deb::${url}/releases/download/${_pkgvername}/${_pkgname}_${pkgver}_${_barch[0]}.deb")
sha256sums_x86_64=('7adf2ea20316420a73fb4b3996fce33ebea0a1fec783425e55acc99860100e97')


package() {
    cd "${pkgdir}"

    # this extracts all into the pkgdir
    tar -xf "${srcdir}/data.tar.gz"
}
