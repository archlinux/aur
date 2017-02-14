# Maintainer: JP-Ellis <josh@jpellis.me>

pkgname=exrootanalysis
pkgver=0.0.23
pkgrel=2
pkgdesc="A package designed to simplify ROOT tree production and analysis."
url="https://cp3.irmp.ucl.ac.be/projects/ExRootAnalysis"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('root')
makedepends=('cmake')
source=("${pkgname}-r${pkgver##*.}.zip::https://cp3.irmp.ucl.ac.be/projects/ExRootAnalysis/changeset/${pkgver##*.}/trunk?old_path=%2F&format=zip"
        "CMakeLists.txt")
sha256sums=('b30897ae035b741fa93f47e7cd5adc5f942d77498c143ef17ef4f1377207086e'
            '6b222226a869c0350e14dce754ebcddf43aa6403f4304104a6e720932b805385')

prepare() {
    cp CMakeLists.txt trunk
}

build() {
    cmake trunk -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr"
    make
}

package() {
    make install
}

# Local Variables:
# mode: sh
# End:
