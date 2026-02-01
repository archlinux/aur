# Maintainer: FrogSnot
_pkgauthor=FrogSnot
_pkgname=Spent
pkgname=${_pkgname,,}-bin
pkgdesc="Minimalist personal finance tracker for Linux desktop"

pkgver=1.1.6
pkgrel=1
_pkgvername=v${pkgver}
_pkgrealversion=1.1.6

arch=('x86_64')
_barch=('amd64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('AGPL3')

provides=("${_pkgname,,}")
depends=('glibc' 'gcc-libs' 'glib2' 'webkit2gtk-4.1' 'gtk3' 'gdk-pixbuf2' 'cairo' 'libayatana-appindicator' 'librsvg' 'libsoup3' 'hicolor-icon-theme')

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.deb::${url}/releases/download/${_pkgvername}/spent_${_pkgrealversion}_${_barch[0]}.deb")
sha256sums=('c4215762b499abb4cf9674a5653c08691bbed2fbcad74441971069d0364485fe'
            '039d45f02015c1bcd91fe4f8f64afe66920c6138e79c775bdb0bf1cf3aa09543')
sha256sums_x86_64=('a6819dd9cdee7ce39e4c06133984419e74c260b02f61d6dc732955bfb16ba306')


package() {
    cd "${pkgdir}/" || exit

    tar -xf "${srcdir}/data.tar.gz"

    install -Dm644 "${srcdir}/README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
