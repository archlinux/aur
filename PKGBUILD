_npmname='reveal-md'
pkgname='nodejs-reveal-md'
pkgver=0.4.0
pkgrel=1
pkgdesc='Get beautiful reveal.js presentations from your Markdown file'
arch=('any')
url='http://webpro.github.io/reveal-md/'
license=('MIT')
depends=('npm')
source=("http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
noextract=("$_npmname-$pkgver.tgz")
sha256sums=('e46d3bcd3d2205d4f38967b777edeb71777e36c94792d69190b325182ccc0aa0')

package() {
    cd $srcdir
    local _npmdir="$pkgdir/usr/lib/node_modules/"
    mkdir -p $_npmdir
    cd $_npmdir
    npm install -g --prefix "$pkgdir/usr" $_npmname@$pkgver
    rm -r "$pkgdir/usr/etc"
}

# vim:set ts=2 sw=2 et:
