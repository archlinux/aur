# Maintainer: Bidski <bidskii at gmail dot com>
pkgname=texlive-acrotex
pkgver=2021.06.19
pkgrel=1
license=('GPL')
depends=('texlive-core')
pkgdesc="A LaTeX bundle for webpages, pdf forms and includin JavaSript into LaTeX"
url="http://www.ctan.org/tex-archive/macros/latex/contrib/acrotex"
arch=('any')
source=("${pkgname}-${pkgver}.zip::http://mirrors.ctan.org/macros/latex/contrib/acrotex.zip")
md5sums=('e91efb05600f22dd832950713471039e')
sha1sums=('1a4e2acbced5a243f0f8726b193a6d24ff98716f')
sha256sums=('dfd13105526d44631049f6bce6f19f0c9547fd023f086582d48c0a0f37a1bae3')
sha384sums=('fbd9fb34f778ba6dd6b4e48ababe890e30afb2d7e25530bc8467b839d51878f98aa4a7c5022a4f6409da0fe94f214d9b')
sha512sums=('a10a2516a262d801d9e7fa6c1c1792dee696b0b23e17bb74970dcfa7cb540cdfdd94f66dfc6e520f81e4a40c845c08e0b9aca8f11b71b2bd1b0496efaed1d608')

build()
{
    cd "${srcdir}/acrotex"
    latex acrotex.ins
    latex dljslib.ins
    latex eforms.ins
    latex exerquiz.ins
    latex insdljs.ins
    latex taborder.ins
    latex web.ins
}

package()
{
    cd "${srcdir}/acrotex"
    
    mkdir -p "${pkgdir}/usr/share/texmf/tex/latex/acrotex"
    cp {*.sty,*.def,*.cfg} "${pkgdir}/usr/share/texmf/tex/latex/acrotex"
    
    mkdir -p "${pkgdir}/usr/share/doc/texlive-acrotex"
    cd "${srcdir}/acrotex/doc"
    cp * "${pkgdir}/usr/share/doc/texlive-acrotex"
}
