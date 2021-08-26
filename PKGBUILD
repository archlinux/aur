_npmname='reveal-md'
pkgname='nodejs-reveal-md'
pkgver=5.1.3
pkgrel=1
pkgdesc='Get beautiful reveal.js presentations from your Markdown file'
arch=('any')
url='http://webpro.github.io/reveal-md/'
license=('MIT')
depends=('nodejs')
conflicts=('reveal-md')
makedepends=('npm')
source=("http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
noextract=('$_npmname-$pkgver.tgz')
sha256sums=('71f09f3c45e515880525f883c3cd09addbb1b4caa98334da557caff7b4ab3382')

package() {
    local _npmdir="$pkgdir/usr/lib/node_modules/"
    mkdir -p $_npmdir
    cd $_npmdir
    npm i --omit=dev --omit=optional --global --prefix "$pkgdir/usr" "$srcdir/$_npmname-$pkgver.tgz"
}

# vim:set ts=2 sw=2 et:
