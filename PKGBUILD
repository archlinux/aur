# Maintainer: Tony Ballhause <tony.ballhause@tu-berlin.de>
pkgname=beamer-theme-tub-git
pkgver=1.0
pkgrel=4
pkgdesc="Unofficial Beamer theme for Technische Universität Berlin"
arch=(any)
url="https://github.com/cola4cube/beamer-theme-tub"
license=('MIT')
depends=('texlive-core')
makedepends=('git')
provides=("${pkgname}")
conflicts=("${pkgname}"
			'beamer-theme-tub')
replaces=('beamer-theme-tub')
source=("git+https://github.com/cola4cube/beamer-theme-tub.git")
install="${pkgname}.install"
sha512sum=('SKIP')
md5sums=('SKIP')

package() {
        TEXMFDIST=$(kpsewhich -var-value=TEXMFDIST)
        cd "$srcdir/beamer-theme-tub"
        mkdir -p ${pkgdir}/${TEXMFDIST}/tex/latex/beamer/themes/{theme,images,inner,outer}

        install -m644 images/TU_Logo_lang_RGB_red.pdf \
                "$pkgdir/$TEXMFDIST/tex/latex/beamer/themes/images/"
        install -m644 theme/beamerthemeTUBlayout.sty \
                "$pkgdir/$TEXMFDIST/tex/latex/beamer/themes/theme/"
        install -m644 theme/beamerinnerthemeTUBlayout.sty \
                "$pkgdir/$TEXMFDIST/tex/latex/beamer/themes/inner/"
        install -m644 theme/beamerouterthemeTUBlayout.sty \
                "$pkgdir/$TEXMFDIST/tex/latex/beamer/themes/outer/"
}
