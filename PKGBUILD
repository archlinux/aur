_npmname='reveal-md'
pkgname='nodejs-reveal-md'
pkgver=0.4.3
pkgrel=1
pkgdesc='Get beautiful reveal.js presentations from your Markdown file'
arch=('any')
url='http://webpro.github.io/reveal-md/'
license=('MIT')
depends=('npm')
source=("http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
noextract=("$_npmname-$pkgver.tgz")
sha256sums=('8c97c3714c78343d7cc1caf25e602f40cda6d4edb1dcc0f925bcea645d7e8b06')

package() {
    cd $srcdir
    local _npmdir="$pkgdir/usr/lib/node_modules/"
    mkdir -p $_npmdir
    cd $_npmdir
    npm install -g --prefix "$pkgdir/usr" $_npmname@$pkgver
    rm -r "$pkgdir/usr/etc"
}

# vim:set ts=2 sw=2 et:
