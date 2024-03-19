# Maintainer: keutain <quentin dot aniere at gmail dot com>

pkgname=utc-latex-article
_latexpkgname=utc-article
pkgver=1.1.1
pkgrel=1
pkgdesc="UTC LaTeX article template"
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
    mkdir -m 755 -p ${pkgdir}/usr/share/licenses/utc-latex/
    install -m 644 "${srcdir}/utc-latex-${pkgver}/licenses/${_latexpkgname}.txt" -t "${pkgdir}/usr/share/licenses/utc-latex/"
}
