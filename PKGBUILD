# maintainer : marin <turquoise.hexagon@protonmail.com>

pkgname=cherry-font-git
pkgver=1.0
pkgrel=2
pkgdesc='cherry, yet another bitmap font'
url=https://github.com/turquoise-hexagon/cherry
source=("$pkgname::git+https://github.com/turquoise-hexagon/cherry")
licence=('MIT')
arch=('any')
makedepends=('git' 'fonttosfnt')
install="$pkgname.install"
md5sums=('SKIP')
sha256sums=('SKIP')

build() {
    cd "$srcdir/$pkgname"

    ./make.sh
}

package() {
    cd "$srcdir/$pkgname"

    install -d -m755 "$pkgdir/usr/share/fonts/misc"
    install -D -m644 *.otb "$pkgdir/usr/share/fonts/misc"
    install -D -m644 LICENSE "$pkgdir/usr/share/licences/$pkgname/LICENSE"
}
