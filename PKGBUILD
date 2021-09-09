# Maintainer: Yufan You <ouuansteve at gmail>

_npmname=server
_npmscope=@volar
pkgname=volar-server
pkgver=0.27.17
pkgrel=1
pkgdesc='Fast Vue Language Support Extension'
arch=('any')
url='https://github.com/johnsoncodehk/volar/tree/master/packages/server'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/$_npmscope/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('b8e24e38ff00bf8844ab735c00e5e369b5e2b1a9236105ad3dcb9d910b533449')

package() {
    cd "$srcdir"
    local _npmdir="$pkgdir/usr/lib/node_modules/"
    mkdir -p "$_npmdir"
    cd "$_npmdir"
    npm install -g --prefix "$pkgdir/usr" "$srcdir/$_npmname-$pkgver.tgz"
    chown -R root:root "${pkgdir}"
    install -Dm644 "$_npmdir/$_npmscope/$_npmname/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
