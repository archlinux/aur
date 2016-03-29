# Maintainer: Caleb Maclennan <caleb@alerque.com>

_npmname=less-plugin-autoprefix
pkgname=nodejs-$_npmname
pkgver=1.5.1
pkgrel=1
pkgdesc="Uses autoprefixer to add prefixes to css after conversion from less"
arch=('any')
url="https://github.com/less/less-plugin-autoprefix"
license=('Apache 2.0')
depends=(
        'nodejs'
        'npm'
        'nodejs-less'
        'nodejs-autoprefixer'
)
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
sha256sums=('90c3cf3afb86f0a0d1d94c0f8a245d3eefa0580b41e8a61fd7dbface6e889476')
noextract=($_npmname-$pkgver.tgz)

package() {
        cd "$srcdir"
        local _npmdir="$pkgdir/usr/lib/node_modules/"
        mkdir -p "$_npmdir"
        cd "$_npmdir"
        npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
