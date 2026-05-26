# Maintainer: T4toh <https://github.com/T4toh>
pkgname=twriter-bin
_pkgname=tWriter
pkgver=0.5.0
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
sha256sums=('697f39126d0c5c6eacf12f4abdf112c15229c449711f5d647be8279f161b2c1b')

package() {
    cd "${srcdir}"
    bsdtar -xf "${pkgname}-${pkgver}.deb"
    bsdtar -xf data.tar.* -C "${pkgdir}"
    # .deb instala a /usr/, queda como está
}
