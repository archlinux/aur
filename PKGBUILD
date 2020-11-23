_npmname='reveal-md'
pkgname='nodejs-reveal-md'
pkgver=4.1.7
pkgrel=3
pkgdesc='Get beautiful reveal.js presentations from your Markdown file'
arch=('any')
url='http://webpro.github.io/reveal-md/'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
noextract=("$_npmname-$pkgver.tgz")
sha256sums=('34a7a6663c3ffd98f6f25fe2b9e5c36d784821f5ee7c0147b393c0d81f5375c1')

package() {
    cd $srcdir
    local _npmdir="$pkgdir/usr/lib/node_modules/"
    mkdir -p $_npmdir
    cd $_npmdir
    npm install -g --production --prefix "$pkgdir/usr" "$_npmname@$pkgver"
}

# vim:set ts=2 sw=2 et:
