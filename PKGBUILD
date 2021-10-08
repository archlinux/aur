# Maintainer: Yufan You <ouuansteve at gmail>

_npmname=server
_npmscope=@volar
pkgname=volar-server
pkgver=0.28.0
pkgrel=1
pkgdesc='Fast Vue Language Support Extension'
arch=('any')
url='https://github.com/johnsoncodehk/volar/tree/master/packages/server'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/$_npmscope/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('16127f1ca136934751efdae93fb84c2d945c3d76cf1d6db67d7b0e22da183f83')

package() {
    cd "$srcdir"
    local _npmdir="$pkgdir/usr/lib/node_modules/"
    mkdir -p "$_npmdir"
    cd "$_npmdir"
    npm install -g --prefix "$pkgdir/usr" "$srcdir/$_npmname-$pkgver.tgz"
    chown -R root:root "${pkgdir}"
    install -Dm644 "$_npmdir/$_npmscope/$_npmname/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
