# Maintainer: Mario Finelli <mario at finel dot li>

_npmname=wintersmith
pkgname=nodejs-$_npmname
pkgver=2.4.1
pkgrel=1
pkgdesc="A flexible static site generator."
arch=('any')
url="https://wintersmith.io"
license=('MIT')
depends=('nodejs' 'npm')
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$_pkgver.tgz)
sha256sums=('d6c6116cf36550c4f691c40258e68ab006a357c6afe9e29fa774adad7e5c2267')

package() {
    cd "$srcdir"
    local _npmdir="$pkgdir/usr/lib/node_modules/"
    mkdir -p "$_npmdir"
    cd "$_npmdir"
    npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$_pkgver
}

