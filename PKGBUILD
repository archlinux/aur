_npmname='reveal-md'
pkgname='nodejs-reveal-md'
pkgver=0.5.0
pkgrel=1
pkgdesc='Get beautiful reveal.js presentations from your Markdown file'
arch=('any')
url='http://webpro.github.io/reveal-md/'
license=('MIT')
depends=('npm')
source=("http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
noextract=("$_npmname-$pkgver.tgz")
sha256sums=('52cd1e5db0a7e0a5d18b21e49596b31862e6ddd07c0d1a1ee0b39459491e0c61')

package() {
    cd $srcdir
    local _npmdir="$pkgdir/usr/lib/node_modules/"
    mkdir -p $_npmdir
    cd $_npmdir
    npm install -g --prefix "$pkgdir/usr" $_npmname@$pkgver
    rm -r "$pkgdir/usr/etc"
}

# vim:set ts=2 sw=2 et:
