# Maintainer: Šimon Leitgeb <leitgeb.simon at gmail dot com>

pkgname=cxltx-styles
pkgver=1.4.7
pkgrel=1
pkgdesc="A (hopefully) sensible collection of basic XeLaTeX style sheets."
arch=('any')
url="https://github.com/loveencounterflow/cxltx-styles"
license=('unknown')
groups=()
depends=('texlive-core')
makedepends=('git')
provides=($pkgname)
install="$pkgname.install"
source=("https://github.com/loveencounterflow/$pkgname/archive/v$pkgver.tar.gz")
md5sums=("3eef6349554666cda7ec47e2cd1391a7")

# pkgver() {
#     cd "$srcdir/$pkgname-$pkgver"
#     git describe --tags --long | sed -r -e 's,^[^0-9]*,,;s,([^-]*-g),r\1,;s,[-_],.,g'
# }

package() {
    cd "$srcdir/$pkgname-$pkgver/styles"
    install -d "$pkgdir/usr/share/texmf/tex/latex/$pkgname"
    install -m644 *.sty "$pkgdir/usr/share/texmf/tex/latex/$pkgname"
    for dir in $(ls -d */); do
        install -d "$pkgdir/usr/share/texmf/tex/latex/$pkgname/$dir"
        install -m644 $dir/*.sty "$pkgdir/usr/share/texmf/tex/latex/$pkgname/$dir"
    done
}
