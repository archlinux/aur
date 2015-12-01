# Maintainer: Jon Gjengset <jon@tsp.io>

pkgname=latex-cvpr
pkgver=1.3.20051024
pkgrel=1
pkgdesc="ACM SIG Proceedings Format style for LaTeX (acm_proc_article-sp and sig-alternate)"
arch=('any')
url="http://www.acm.org/sigs/publications/proceedings-templates"
conflicts=('latex-template-acm')
license=('unknown')
depends=('texlive-core')
install=texlive.install
source=('http://www.pamitc.org/cvpr15/files/cvpr2015AuthorKit.tgz')

pkgver() {
  cd "${srcdir}/cvpr2015AuthorKit/latex"
  grep '$Id:' cvpr.sty | sed -e 's/.*,v \(.*\) [0-9][0-9]:.*/\1/' -e 's@ @.@g' -e 's@/@@g'
}

package() {
  cd "${srcdir}/cvpr2015AuthorKit/latex"
  install -d ${pkgdir}/usr/share/texmf-dist/tex/latex/cvpr/
  install -m 644 *.sty ${pkgdir}/usr/share/texmf-dist/tex/latex/cvpr/
  install -m 644 *.bst ${pkgdir}/usr/share/texmf-dist/tex/latex/cvpr/
  install -d ${pkgdir}/usr/share/texmf-dist/bibtex/bst/ieee/
  install -m 644 *.bst ${pkgdir}/usr/share/texmf-dist/bibtex/bst/ieee/
}

md5sums=('4369f672c35575edd15df20b37fc9dda')

# vim:set ts=2 sw=2 et:
