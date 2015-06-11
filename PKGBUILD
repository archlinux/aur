# Maintainer: Stephen Brennan <smb196@case.edu>
pkgname=beamer-theme-cwru-git
pkgver=r10.9482287
pkgrel=2
pkgdesc="Beamer theme for Case Western Reserve University."
arch=(any)
url="https://github.com/mruffalo/beamer-theme-cwru/tree/master/theme"
license=('unknown')
depends=('texlive-core')
makedepends=('git') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install="${pkgname}.install"
source=('git://github.com/mruffalo/beamer-theme-cwru.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname%-git}"
        mkdir -p $pkgdir/usr/share/texmf-dist/tex/latex/beamer/themes/{theme,images}

        install -m644 images/cwru-logo-blue-light.pdf \
                "$pkgdir/usr/share/texmf-dist/tex/latex/beamer/themes/images/"
        install -m644 images/cwru-logo-blue.pdf \
                "$pkgdir/usr/share/texmf-dist/tex/latex/beamer/themes/images/"
        install -m644 theme/beamercolorthemeCWRU.sty \
                "$pkgdir/usr/share/texmf-dist/tex/latex/beamer/themes/theme/"
        install -m644 theme/beamerouterthemeCWRU.sty \
                "$pkgdir/usr/share/texmf-dist/tex/latex/beamer/themes/theme/"
        install -m644 theme/beamerthemeCWRU.sty \
                "$pkgdir/usr/share/texmf-dist/tex/latex/beamer/themes/theme/"
}
