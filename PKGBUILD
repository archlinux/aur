_npmname='reveal-md'
pkgname='nodejs-reveal-md'
pkgver=4.1.6
pkgrel=3
pkgdesc='Get beautiful reveal.js presentations from your Markdown file'
arch=('any')
url='http://webpro.github.io/reveal-md/'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
noextract=("$_npmname-$pkgver.tgz")
sha256sums=('92601de37683ada922fc377c8d6e5ed028e5e89d05d3cb4a9e67b1085e467d9d')

package() {
    cd $srcdir
    local _npmdir="$pkgdir/usr/lib/node_modules/"
    mkdir -p $_npmdir
    cd $_npmdir
    npm install -g --production --prefix "$pkgdir/usr" "$_npmname@$pkgver"
}

# vim:set ts=2 sw=2 et:
