# Maintainer: Dan Printzell <xwildn00bx@gmail.com>
# Contributor: Marius O<marius@habarnam.ro>

pkgname=('coedit-bin')
pkgver=3_update_2
pkgrel=1
pkgdesc="Coedit is an IDE for the DMD D2 compiler."
url="https://github.com/BBasile/Coedit"
license=('MIT')
makedepends=('unzip')
depends=(
	'dmd'
	'dcd'
)
optdepends=(
	'gdb: optional, the GNU debugger'
	'dtools: optional, allows to demangle the symbols in the message widget'
	'dub: optional, the D package manager, mandatory to compile project in DUB format'
	'dfmt: optional, the D source code formater, needed by the Dfmt commander widget'
	'dscanner: optional, the D source code analyzer'
	'ldc: optional, the LDC D compiler'
	'gdc: optional, the GDC D compiler'
)
provides=("coedit")
conflicts=("coedit")
arch=("x86" "x86_64")

source_i686=(
	"https://github.com/BBasile/Coedit/releases/download/${pkgver}/${pkgname%-bin}.${pkgver//_}.linux32.zip"
	"coedit.desktop"
)

source_x86_64=(
	"https://github.com/BBasile/Coedit/releases/download/${pkgver}/${pkgname%-bin}.${pkgver//_}.linux64.zip"
	"coedit.desktop"
)

sha256sums_i686=(
	'cb3a94ae707db17edbccafe0ebdc942a1d05bd8ee9237bc0cf900124c9deedfd'
	'SKIP'
)
sha256sums_x86_64=(
	'18661dff321add37980cdd19c242e04dbbfd12bb70fd633c9256d5c478cdfabf'
	'SKIP'
)

package() {
    install -Dm755 $srcdir/coedit*/coedit ${pkgdir}/usr/bin/coedit
    install -Dm755 $srcdir/coedit*/dastworx ${pkgdir}/usr/bin/dastworx

    install -Dm644 $srcdir/coedit*/coedit.png ${pkgdir}/usr/share/icons/coedit.png 
    install -Dm644 $srcdir/coedit*/coedit.license.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
    install -Dm644 coedit.desktop ${pkgdir}/usr/share/applications/coedit.desktop 
}
