# Maintainer: Mario Finelli <mario at finel dot li>

_npmname=mjml
pkgname=nodejs-$_npmname
pkgver=2.3.0
pkgrel=1
pkgdesc="The only framework that makes responsive-email easy."
arch=('any')
url="https://mjml.io/"
license=('MIT')
depends=('nodejs' 'npm')
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('4afcf4ca3c2efc3cb1fd7accb78c94cafc4a8cd6c07ac3e106a73c0598785b56')

package() {
    cd "$srcdir"
    local _npmdir="$pkgdir/usr/lib/node_modules/"
    mkdir -p "$_npmdir"
    cd "$_npmdir"
    npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
