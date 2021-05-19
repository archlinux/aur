# Maintainer: Caleb Maclennan <caleb@alerque.com>

_npmname=less-plugin-clean-css
pkgname=nodejs-$_npmname
pkgver=1.5.1
pkgrel=2
pkgdesc='Post-process and compress CSS using clean-css'
arch=(any)
url="https://github.com/less/$_npmname"
license=(MIT)
depends=(nodejs
         npm
         nodejs-less
         nodejs-clean-css)
source=("https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
sha256sums=('c5cd0dbe94303e4660f89540ae6f5d28f197272f11b57744a1b5dccb4f398830')
noextract=("$_npmname-$pkgver.tgz")

package() {
    cd "$srcdir"
    local _npmdir="$pkgdir/usr/lib/node_modules/"
    mkdir -p "$_npmdir"
    cd "$_npmdir"
    npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}

