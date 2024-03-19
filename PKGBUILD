# Maintainer: keutain

pkgname=utc-latex-beamer
_latexpkgname=utc-beamer
pkgver=1.1.0
pkgrel=1
pkgdesc="UTC LaTeX Beamer theme"
url="https://github.com/qaniere/utc-latex"
arch=("any")
license=("WTFPL")
depends=("texlive-basic")
source=("$pkgname-$pkgver.tar.gz::https://github.com/qaniere/utc-latex/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('0b2688308e27aab759c3b3fdb3135c59d33c01a3f7d21054083e49e96effcfcd')

package() {
    # Get the proper installation path
    TEXMFDIST=$(kpsewhich -var-value=TEXMFDIST)

    # Install the files to the correct path
    mkdir -m 755 -p  "${pkgdir}/${TEXMFDIST}/tex/latex/${_latexpkgname}"
    install -Dm644 "${srcdir}/utc-latex-${pkgver}/${_latexpkgname}"/* -t "${pkgdir}/${TEXMFDIST}/tex/latex/${_latexpkgname}"

    # Install the license
    install -Dm644 "${srcdir}/utc-latex-${pkgver}/licenses/${_latexpkgname}.txt" -t "${pkgdir}/usr/share/licenses/utc-latex/${_latexpkgname}.txt"
}
