# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=texlive-qrcode
pkgver=1.51
pkgrel=1
license=('GPL')
depends=('texlive-core')
pkgdesc='Generates QR (Quick Response) codes in LaTeX'
url='https://www.ctan.org/tex-archive/macros/latex/contrib/qrcode'
arch=('any')
source=("$pkgname-$pkgver.zip::http://mirrors.ctan.org/macros/latex/contrib/qrcode.zip")
sha256sums=('f26e9c63e547f53e77bdbf79f0bb46378cad6a449686586ba1681f6f5dd92439')

build() {
 cd qrcode
 latex qrcode.ins
}

package() {
  cd qrcode

  mkdir -p "${pkgdir}/usr/share/texmf/tex/latex/qrcode"
  cp qrcode.sty "${pkgdir}/usr/share/texmf/tex/latex/qrcode"

  mkdir -p "${pkgdir}/usr/share/doc/texlive-qrcode"
  cp qrcode.pdf $pkgdir/usr/share/doc/texlive-qrcode
}
