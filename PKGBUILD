_npmname='reveal-md'
pkgname='nodejs-reveal-md'
pkgver=5.1.2
pkgrel=3
pkgdesc='Get beautiful reveal.js presentations from your Markdown file'
arch=('any')
url='http://webpro.github.io/reveal-md/'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
noextract=("$_npmname-$pkgver.tgz")
sha256sums=('d549a0ee93cdd8397267ad0f43ec7dd2c2ed0956090cab8c7a1826347628d484')

package() {
    cd $srcdir
    local _npmdir="$pkgdir/usr/lib/node_modules/"
    mkdir -p $_npmdir
    cd $_npmdir
    npm install -g --production --prefix "$pkgdir/usr" "$_npmname@$pkgver"
}

# vim:set ts=2 sw=2 et:
