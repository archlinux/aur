# Maintainer: entshuld <edgar [not at] openmail [dot] cc />
_base=academicons
pkgname=ttf-"${_base}"
pkgver=1.9.1
pkgrel=1
pkgdesc="Specialist icon font for academics (without texlive-fontextra)"
arch=(any)
url="https://jpswalsh.github.io/academicons/"
license=("SIL 1.1")
source=("https://mirrors.ctan.org/fonts/academicons.zip")
sha512sums=('57dce32358574c3b78d47e12510f25fbce08426bd891f96ffbb7638755fc099f28944cc3f1ea20b69aefd0a62b09c74f8e57dbfc836c3495a0f87b312ec8982d')
makedepends=("unzip")
conflicts=("texlive-fontsextra")

package() {
	cd "${srcdir}"/${_base}
	mkdir -p "${pkgdir}"/usr/share/fonts/TTF/public/${_base}
	install -m644 ./*.ttf "${pkgdir}"/usr/share/fonts/TTF/public/${_base}
    mkdir -p "${pkgdir}"/usr/share/texmf-dist/tex/latex/academicons/
    install -m644 ./*.sty ./*.fd "${pkgdir}"/usr/share/texmf-dist/tex/latex/academicons/

    # These are already installed by texlive-doc
    # /usr/share/doc/texlive/fonts/academicons/academicons.pdf
    # /usr/share/doc/texlive/fonts/academicons/README

    # This is from texlive-fontsextra
    # usr/share/texmf-dist/fonts/truetype/public/academicons/
    # usr/share/texmf-dist/fonts/truetype/public/academicons/academicons.ttf
    # usr/share/texmf-dist/tex/latex/academicons/
    # usr/share/texmf-dist/tex/latex/academicons/academicons.sty
    # usr/share/texmf-dist/tex/latex/academicons/tuacademicons.fd

	# TODO license is not available
	# install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
