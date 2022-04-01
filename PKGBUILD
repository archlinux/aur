# Maintainer: Bidski <bidskii at gmail dot com>
pkgname=texlive-acrotex
pkgver=2021.10.03
pkgrel=1
license=('GPL')
depends=('texlive-core')
pkgdesc="A LaTeX bundle for webpages, pdf forms and includin JavaSript into LaTeX"
url="http://www.ctan.org/tex-archive/macros/latex/contrib/acrotex"
arch=('any')
source=("${pkgname}-${pkgver}.zip::http://mirrors.ctan.org/macros/latex/contrib/acrotex.zip")
md5sums=('cecb0d6fa66ada3ac8ebc1d6c3380f89')
sha1sums=('79baf82d99fd4eb1d22bd2b92ac0f02163f7803b')
sha256sums=('4043563b8c4bc15526e0c4c9cca585643f417bfeb0be1bdcc712d572ebe894df')
sha384sums=('ba036434de2de51e6a8afe0b4538fc3172be8068fb7a42859ab776a50da598200b677358a576e27104b98fa205612d5b')
sha512sums=('56c85eb77429961e014fe8b2f1adf05e914f1583e15d30761a71fe841c22115806a0cc535a41125663f17f9c0fa08a22c514299bff291e69e92aecbfcecff8ef')

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
