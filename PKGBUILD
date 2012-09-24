# Contributor: Olivier Mehani <shtrom-aur@ssji.net>
# $Id$
# vim:set ts=2 sw=2 et:

pkgname=latex-template-acm
pkgver=201209
pkgrel=1
pkgdesc="ACM SIG Proceedings Format style for LaTeX (acm_proc_article-sp v3.2SP, sig-alternate v2.4, sigplanconf v2.5 and the unofficial sigplan-proc-varsize v1.4)"
arch=('any')
url="http://www.acm.org/sigs/publications/proceedings-templates, http://sigplan.acm.org/authorInformation.htm, http://www.isi.edu/~johnh/SOFTWARE/LATEX/"
_sigproc_url="http://www.acm.org/sigs/publications"
_sigplan_url="http://drupal.sigplan.org/sites/default/files"
license=('')
groups=()
depends=('texlive-latex3')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=texlive.install
source=(${_sigproc_url}/sigproc-sp.pdf
${_sigproc_url}/acm_proc_article-sp.cls
${_sigproc_url}/sigproc-sp.tex
${_sigproc_url}/sigproc.bib
${_sigproc_url}/flies.eps
${_sigproc_url}/fly.eps
${_sigproc_url}/rosette.ps
${_sigproc_url}/sig-alternate.pdf
${_sigproc_url}/sig-alternate.cls
${_sigproc_url}/sig-alternate.tex
${_sigplan_url}/sigplanconf.cls
${_sigplan_url}/sigplanconf-template.tex
${_sigplan_url}/sigplanconf-guide.pdf
http://www.isi.edu/~johnh/SOFTWARE/LATEX/sigplan-proc-varsize-package.tar.gz
)

build() {
  mkdir -p ${pkgdir}/usr/share/texmf-dist/tex/latex/{sigproc,sigplan,sigplan-proc-varsize}
  cp ${srcdir}/{acm_proc_article-sp,sigproc,flies,fly,rosette,sig-alternate}* \
    ${pkgdir}/usr/share/texmf-dist/tex/latex/sigproc
  cp ${srcdir}/sigplanconf* ${pkgdir}/usr/share/texmf-dist/tex/latex/sigplan
  tar xzvf ${srcdir}/sigplan-proc-varsize-package.tar.gz \
    -C ${pkgdir}/usr/share/texmf-dist/tex/latex/sigplan-proc-varsize
}

md5sums=('d0f0b981aafbbc5ecaec202bd7623414'
         '49fc14f68a73f326183ff0d766bec0c2'
         '33f9dffef2394f245e8774bd6b640567'
         '045cff45096bc53833df7eca105d1ace'
         'c6a1b19bf288f26bc2dba4b72ac7d457'
         '557a5283c73690acc0ef2d5a1adc5e61'
         'da992183e40385e6cab3e7d4feece0f4'
         'cff982aef1c6e5b427ade8a95700b9ae'
         '8230a5fbf2c386a55d2f105c064c7f85'
         '1e1ec310c153a97ddc9d61905053dd52'
         '17d0873225f21a5ba0d533ae292c6906'
         '309f0d83e52e6e70b9608f8f4b0e9ced'
         '4a6f87c61d9c7fca4b94c892e4742867'
         '216c50b96e931516e9c3fba2567d5838')
