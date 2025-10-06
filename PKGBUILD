#Maintainer: Plague-doctor <plague <at>> privacyrequired <<dot>> com >

pkgname=spw
pkgver=2.0
pkgrel=1
pkgdesc="spw - secure password generator"
arch=('any')
url="https://git.netsi.xyz/plague-doctor/spw"
license=('GPL')
depends=('python')
makedepends=('git')
source=("$pkgname::git+https://git.netsi.xyz/plague-doctor/spw#tag=2.0")
sha256sums=('ac650b3a629781e82b0247b613f7134e712f84db62ee89b94575c70d4ca9e05d')

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --tags --abbrev=0 | sed 's/^v//'
}

validpgpkeys=('A8F7858263C1E39480B731DCEAD4F103068DF8E5')

package() {
    install -d "$pkgdir/usr/bin"
    install -d "$pkgdir/usr/share/man/man1/"
    install -d "$pkgdir/usr/share/dict/"
    install "$srcdir/$pkgname/spw.py" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "$srcdir/$pkgname/dict/spw_en" "${pkgdir}/usr/share/dict/spw_en"
    install -Dm644 "$srcdir/$pkgname/man/spw.1" "${pkgdir}/usr/share/man/man1/"
}
