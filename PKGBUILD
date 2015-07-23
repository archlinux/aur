pkgname=texlive-culmus
pkgver=0.7.1
pkgrel=2
pkgdesc="Hebrew fonts from the Culmus project for LaTeX"
arch=('any')
license=('GPL2' 'custom:culmus')
url=("http://www.guyrutenberg.com/culmus-latex/")
depends=(texlive-core)
install=$pkgname.install
conflicts=(culmus-latex)
source=("http://downloads.sourceforge.net/project/ivritex/culmus-latex/culmus-latex-0.7/culmus-latex-0.7-r1.tar.gz")
md5sums=('0c6f6d5b9e7a0d6ba59fc55680ed48a5')

package() {
	cd $srcdir/culmus-latex-0.7-r1
	TEXDIST=usr/share/texmf-dist
	for dir in \
			tex/generic/0babel/ \
			tex/latex/culmus/ \
			fonts/enc/dvips/culmus/ \
			fonts/map/dvips/ \
			fonts/tfm/public/culmus/ \
			fonts/afm/public/culmus/ \
			fonts/vf/public/culmus/ \
			fonts/type1/public/culmus/; do
		install -d $pkgdir/$TEXDIST/$dir
		install -m644 usr/share/texmf/$dir/* $pkgdir/$TEXDIST/$dir
	done;
	install -D -m 644 LICENSE-Culmus "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-Culmus"
}

