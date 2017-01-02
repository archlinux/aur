# Maintainer: Mario Finelli <mario at finel dot li>

_npmname=mjml
pkgname=nodejs-$_npmname
pkgver=3.1.1
pkgrel=1
pkgdesc="The only framework that makes responsive-email easy."
arch=('any')
url="https://mjml.io/"
license=('MIT')
depends=('nodejs' 'npm')
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('239d91cb0686230d5bf07c2175d4387181e1862bd9d6316a8a85b0dbf2724b6a')

package() {
    cd "$srcdir"
    local _npmdir="$pkgdir/usr/lib/node_modules/"
    mkdir -p "$_npmdir"
    cd "$_npmdir"
    npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
