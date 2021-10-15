# Maintainer: Yufan You <ouuansteve at gmail>

_npmname=server
_npmscope=@volar
pkgname=volar-server
pkgver=0.28.4
pkgrel=1
pkgdesc='Fast Vue Language Support Extension'
arch=('any')
url='https://github.com/johnsoncodehk/volar/tree/master/packages/server'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/$_npmscope/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('9da34d9c7efbc951f97d2788848c9967fabf4ee2db693cb86c44b5c97fd235ba')

package() {
    cd "$srcdir"
    local _npmdir="$pkgdir/usr/lib/node_modules/"
    mkdir -p "$_npmdir"
    cd "$_npmdir"
    npm install -g --prefix "$pkgdir/usr" "$srcdir/$_npmname-$pkgver.tgz"
    chown -R root:root "${pkgdir}"
    install -Dm644 "$_npmdir/$_npmscope/$_npmname/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
