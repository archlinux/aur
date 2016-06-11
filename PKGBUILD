# Maintainer: Mario Finelli <mario at finel dot li>

_npmname=shipit-cli
pkgname=nodejs-$_npmname
pkgver=1.4.1
pkgrel=1
pkgdesc="Universal automation and deployment tool written in JavaScript."
arch=('any')
url='https://github.com/shipitjs/shipit'
license=('MIT')
depends=('nodejs' 'npm')
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('cc0be1b9ca8122ed2a010f6ed1ece11c866d9d4cca3f1c139dde5fc2dec5b0b2')

package() {
    cd "$srcdir"
    local _npmdir="$pkgdir/usr/lib/node_modules/"
    mkdir -p "$_npmdir"
    cd "$_npmdir"
    npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
