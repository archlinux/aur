# Maintainer: Caleb Maclennan <caleb@alerque.com>

_npmname=csscomb
pkgname=nodejs-$_npmname
pkgver=3.1.7
pkgrel=1
pkgdesc="Coding style formatter for CSS"
arch=('any')
url="https://github.com/csscomb/csscomb.js"
license=('MIT')
depends=(
        'nodejs'
        'npm'
)
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
sha256sums=('4236da60e7003787aa3cb4e15609214646572d19faf4001bc5f471b8ab2c94b1')
noextract=($_npmname-$pkgver.tgz)

package() {
        cd "$srcdir"
        local _npmdir="$pkgdir/usr/lib/node_modules/"
        mkdir -p "$_npmdir"
        cd "$_npmdir"
        npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
