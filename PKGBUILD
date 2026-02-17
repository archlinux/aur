# Maintainer: FrogSnot
_pkgauthor=FrogSnot
_pkgname=Spent
pkgname=${_pkgname,,}-bin
pkgdesc="Minimalist personal finance tracker for Linux desktop"

pkgver=1.1.8
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
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.deb::${url}/releases/download/${_pkgvername}/Spent_1.1.8_amd64.deb")
sha256sums=('c4215762b499abb4cf9674a5653c08691bbed2fbcad74441971069d0364485fe'
            '653f11d1727ec10d03c4a80968189b49fe7d96e94db8d9b1df6376c3b29d9a16')
sha256sums_x86_64=('56db80840ef2c3f8975e7398a906119d1aa4075d6febf4bbefbc8e2da29994b4')


package() {
    cd "${pkgdir}/" || exit

    tar -xf "${srcdir}/data.tar.gz"

    install -Dm644 "${srcdir}/README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
