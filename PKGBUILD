# Maintainer: Jon Gjengset <jon@tsp.io>
# Contributor: Olivier Mehani <shtrom-aur@ssji.net>
# Maintained at https://github.com/jonhoo/latex-acm-sig-PKGBUILD

pkgname=latex-acm-sig
pkgver=20120523
pkgrel=2
pkgdesc="ACM SIG Proceedings Format style for LaTeX (acm_proc_article-sp and sig-alternate)"
arch=('any')
url="http://www.acm.org/sigs/publications/proceedings-templates"
conflicts=('latex-template-acm')
license=('unknown')
depends=('texlive-core')
install=texlive.install
source=(
  http://www.acm.org/sigs/publications/acm_proc_article-sp.cls
  http://www.acm.org/sigs/publications/sig-alternate.cls
)

pkgver() {
  grep "tracking data" *.cls | sed 's/.*{\(.*\)}.*/\1/' | awk '{print "date -d\""$0"\" +%Y%m%d"}' | sh | sort | tail -n1
}

package() {
  install -d ${pkgdir}/usr/share/texmf-dist/tex/latex/acm-sigproc/
  install -m 644 *.cls ${pkgdir}/usr/share/texmf-dist/tex/latex/acm-sigproc/
  ln -s /usr/share/texmf-dist/tex/latex/acm-sigproc/acm_proc_article-sp.cls ${pkgdir}/usr/share/texmf-dist/tex/latex/acm-sigproc/sig-proc.cls
}

md5sums=('49fc14f68a73f326183ff0d766bec0c2'
         '8230a5fbf2c386a55d2f105c064c7f85')

# vim:set ts=2 sw=2 et:
