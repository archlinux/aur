# Maintainer: Yufan You <ouuansteve at gmail>

_npmname=server
_npmscope=@volar
pkgname=volar-server-bin
_pkgname=volar-server
pkgver=0.31.2
pkgrel=1
pkgdesc='Fast Vue Language Support Extension'
arch=('any')
url='https://github.com/johnsoncodehk/volar/tree/master/packages/server'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(https://registry.npmjs.org/$_npmscope/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('2facf1b21a70e6b09c9c3eea48295df12a1967edfbd51f017952e23b2691e439')

package() {
    cd "$srcdir"
    local _npmdir="$pkgdir/usr/lib/node_modules/"
    mkdir -p "$_npmdir"
    cd "$_npmdir"
    npm install -g --prefix "$pkgdir/usr" "$srcdir/$_npmname-$pkgver.tgz"
    chown -R root:root "${pkgdir}"
    install -Dm644 "$_npmdir/$_npmscope/$_npmname/LICENSE" -t "$pkgdir/usr/share/licenses/$_pkgname"
}
