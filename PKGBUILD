_npmname='reveal-md'
pkgname='nodejs-reveal-md'
pkgver=1.1.0
pkgrel=1
pkgdesc='Get beautiful reveal.js presentations from your Markdown file'
arch=('any')
url='http://webpro.github.io/reveal-md/'
license=('MIT')
depends=('npm')
source=("http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
noextract=("$_npmname-$pkgver.tgz")
sha256sums=('3e614910b451f479a70dd574077578573370a4dbec915bbef2aa3b28f8c600a1')

package() {
    cd $srcdir
    local _npmdir="$pkgdir/usr/lib/node_modules/"
    mkdir -p $_npmdir
    cd $_npmdir
    npm install -g --prefix "$pkgdir/usr" $_npmname@$pkgver
    rm -r "$pkgdir/usr/etc"
}

# vim:set ts=2 sw=2 et:
