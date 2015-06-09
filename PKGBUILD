#Original author: Marat Akhin <akhin [at] kspt.icc.spbstu.ru>
#Maintainer: Kirill Gagarski <gagarski [at] kspt.icc.spbstu.ru>
pkgname=texlive-csse-fcs-hg
pkgver=a1b0638
pkgrel=5
pkgdesc="LaTeX class for dissertations at http://kspt.icc.spbstu.ru/"
arch=('any')
url="https://bitbucket.org/ice_phoenix/csse-fcs-latex/"
license=('LPPL')
makedepends=('mercurial')
depends=('texlive-core' 'texlive-langcyrillic')
provides=('texlive-csse-fcs')
conflicts=('texlive-csse-fcs')
install=texlive-csse-fcs.install

_hgrepo="csse-fcs-latex"
source=("hg+https://bitbucket.org/ice_phoenix/$_hgrepo")
md5sums=("SKIP")
package() {
  mkdir -p "$pkgdir/usr/share/texmf-dist/tex/latex/csse-fcs"
  cp -r $srcdir/$_hgrepo/* "$pkgdir/usr/share/texmf-dist/tex/latex/csse-fcs/"
}

pkgver() {
	cd "$srcdir/$_hgrepo"
	hg identify -n
}