# Maintainer: Robert Kubosz <kubosz.robert@gmail.com>

pkgname=urw-classico
pkgver=1.0
pkgrel=1
pkgdesc='URW Classico font from CTAN (for texlive)'
arch=('any')
license=('CUSTOM:alladin')
url='http://www.ctan.org/pkg/urw-classico'
depends=('texlive-core')
install=$pkgname.install
source=('http://mirror.ctan.org/fonts/urw/classico.zip'
        'license')
md5sums=('e8ce4a2c293ffe386bf5800e0f9f89df'
         '330cccd8a2978150e99c5e20926af5f3')

package() {
    cd "$srcdir"
    texmf_root=usr/share/texmf/tex/latex
    mkdir -p "$pkgdir/$texmf_root/classico"
    cp -r classico "$pkgdir/$texmf_root"
    install -Dm644 $srcdir/license "$pkgdir/usr/share/licenses/$pkgname/license"
}
