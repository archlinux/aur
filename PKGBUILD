# Maintainer: FrogSnot
_pkgauthor=FrogSnot
_pkgname=Spent
pkgname=${_pkgname,,}-bin
pkgdesc="Minimalist personal finance tracker for Linux desktop"

pkgver=1.2.1
pkgrel=2
_pkgvername=v${pkgver}

arch=('x86_64')
_barch=('amd64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('AGPL3')

provides=("${_pkgname,,}")
depends=('glibc' 'gcc-libs' 'glib2' 'webkit2gtk-4.1' 'gtk3' 'gdk-pixbuf2' 'cairo' 'libayatana-appindicator' 'librsvg' 'libsoup3' 'hicolor-icon-theme')

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.deb::${url}/releases/download/${_pkgvername}/Spent_1.2.1_amd64.deb")
sha256sums=('c4215762b499abb4cf9674a5653c08691bbed2fbcad74441971069d0364485fe'
            '67640b835087631300993c7acb4a6ef41fca40666a9ce604249c5792b2186ca8')
sha256sums_x86_64=('2213ee84bf421d7475f75ffc6abd8ab4780e30dc2ed511ce3cc165b4baa0381a')


package() {
    cd "${pkgdir}/" || exit

    tar -xf "${srcdir}/data.tar.gz"

    install -Dm644 "${srcdir}/README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
