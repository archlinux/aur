# Maintainer: Stunkymonkey
pkgname=beamer-theme-metropolis
pkgver=1.2
pkgrel=1
pkgdesc="A modern LaTeX Beamer theme"
url="https://github.com/matze/mtheme"
arch=("any")
license=("custom:cc-by-sa-4.0")
depends=("texlive-core" "texlive-pictures" "ttf-fira-sans")
source=("https://github.com/matze/mtheme/archive/v${pkgver}.tar.gz")
install=${pkgname}.install
sha512sums=('61e921a425f16b3fd12961533a5e2ec790d7d80e06d98a837156693082dd8254dfb9840498ce8e561924fb8c5241e9934e9cb1e7b7f1f8caef3cbd8edfae4af7')

build() {
    # Generate the style files.
    cd "$srcdir/mtheme-${pkgver}"
    make
}

package() {
    TEXMFDIST=$(kpsewhich -var-value=TEXMFDIST)
    cd "$srcdir"/mtheme-"${pkgver}"
    make DESTDIR="$pkgdir/$TEXMFDIST" install
}

