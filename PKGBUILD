# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=FrogSnot
_pkgname=Spent
pkgname=${_pkgname,,}-bin
pkgdesc="Minimalist personal finance tracker for Linux desktop"

pkgver=1.1.2
pkgrel=1
_pkgvername=v${pkgver}
_pkgrealversion=1.1.1

arch=('x86_64')
_barch=('amd64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname,,}")
conflicts=("${_pkgname,,}" "opensp")
depends=('glibc' 'gcc-libs' 'glib2' 'webkit2gtk-4.1' 'gtk3' 'gdk-pixbuf2' 'cairo' 'libayatana-appindicator' 'librsvg' 'libsoup3' 'hicolor-icon-theme')

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.deb::${url}/releases/download/${_pkgvername}/${_pkgname}_${_pkgrealversion}_${_barch[0]}.deb")
sha256sums=('c4215762b499abb4cf9674a5653c08691bbed2fbcad74441971069d0364485fe'
            'fbe2e13189a6d7957b3650ec518e5f98a36b0f6ef67c7296fc607dacf8d21a9b')
sha256sums_x86_64=('b9da92631fd5bb8c2709346b54b998543d07e255f95315f2aecf8c69f3d19c96')


package() {
    cd "${pkgdir}/" || exit

    # this extracts all into the pkgdir
    tar -xf "${srcdir}/data.tar.gz"

    install -Dm644 "${srcdir}/README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
