# Maintainer: Sean Enck <enckse@gmail.com>
pkgname=texlive-conv-xkv
pkgver=2017.02.17
pkgrel=2
license=('LPPL')
depends=('texlive-core')
pkgdesc="This small package supports key-value syntax other than the standard latex syntax of <key>=<value>"
url="http://www.ctan.org/tex-archive/macros/latex/contrib/conv-xkv"
arch=('any')
source=("$pkgname-$pkgver.zip::http://mirrors.ctan.org/macros/latex/contrib/conv-xkv.zip")
sha256sums=('ea106330d23371e919805b75d1dfb5a3a010e2c7c3dfff3877ca34e5d272f2d4')

build() {
    cd "$srcdir/conv-xkv"
    latex conv-xkv.ins
}

package() {
    cd "$srcdir/conv-xkv"
    mkdir -p "$pkgdir/usr/share/texmf/tex/latex/conv-xkv"
    cp *.sty "$pkgdir/usr/share/texmf/tex/latex/conv-xkv"
    mkdir -p "$pkgdir/usr/share/doc/${pkgname}"
    cd "$srcdir/conv-xkv/doc"
    cp * "$pkgdir/usr/share/doc/${pkgname}"
}
