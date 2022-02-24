# Maintainer: Abdelhak Bougouffa <abougouffa@fedoraproject.org>
_pkgname=bmc
pkgname=${_pkgname}-git
pkgver=r180.b03bc88
pkgrel=1
pkgdesc="BMC: My bespoke, multipurpose class; designed for general use in LaTeX documents."
url="https://github.com/tecosaur/BMC"
arch=("any")
license=("LPPL")
depends=("texlive-core" "texlive-pictures" "ttf-ibm-plex")
source=($pkgname::git+https://github.com/tecosaur/BMC.git)
install=${pkgname}.install
sha512sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    TEXMFDIST=$(kpsewhich -var-value=TEXMFDIST)
    INSTALL_DIR="$pkgdir/$TEXMFDIST/${_pkgname}"
    mkdir -p "$INSTALL_DIR"
    cd "$srcdir/$pkgname"
    cp *.sty *.cls "$INSTALL_DIR"
}
