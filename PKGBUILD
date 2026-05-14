# Maintainer: T4toh <https://github.com/T4toh>
pkgname=twriter-bin
_pkgname=tWriter
pkgver=0.3.2
pkgrel=1
pkgdesc="Editor de novelas en ES/EN con conversor RAE de diálogos, gramática vía LanguageTool, export EPUB"
arch=('x86_64')
url="https://github.com/T4toh/tWriter"
license=('MIT')
depends=(
    'webkit2gtk-4.1'
    'gtk3'
    'librsvg'
    'libayatana-appindicator'
)
optdepends=(
    'pandoc: importar archivos .docx/.odt'
    'docker: correr LanguageTool local'
)
provides=('twriter')
conflicts=('twriter')
options=('!strip' '!debug')
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.deb::https://github.com/T4toh/tWriter/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
sha256sums=('d9f27eb100477b931e5ddd4e4bf7d74c5807fa8e598d9a8b8df3bc669b3aa62c')

package() {
    cd "${srcdir}"
    bsdtar -xf "${pkgname}-${pkgver}.deb"
    bsdtar -xf data.tar.* -C "${pkgdir}"
    # .deb instala a /usr/, queda como está
}
