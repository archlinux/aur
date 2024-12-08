# Maintainer: Mufeed Ali
pkgname=dainonotes
pkgver=3.1.2
pkgrel=1
pkgdesc="Qt-based note-taking application"
arch=('x86_64')
url="https://get-notes.com/"
_ghurl="https://github.com/nuttyartist/daino-notes-public"
license=('custom')
conflicts=("${pkgname}-bin")
provides=("${pkgname}")
options=(!strip)
makedepends=('tar')
depends=(
    "qt6-base"
    "qt6-declarative"
)
source=("${pkgname}-${pkgver}-x86_64.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname}_${pkgver}_amd64.deb")
sha256sums=('0a2aa20c90005f8c02e4f69e15f5e67e63d4585856cce9e5f3dc851bd48dc304')

package() {
    cd "${pkgdir}"

    # this extracts all into the pkgdir
    tar xf "${srcdir}/data.tar.gz"
}
