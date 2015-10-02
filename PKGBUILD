_npmname=less-plugin-clean-css
pkgname=nodejs-$_npmname
pkgver=1.5.1
pkgrel=1
pkgdesc="Post-process and compress CSS using clean-css"
arch=('any')
url="https://github.com/less/less-plugin-clean-css"
license=('MIT')
depends=(
        'nodejs'
        'npm'
        'nodejs-less'
        'nodejs-clean-css'
)
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)

package() {
        cd "$srcdir"
        local _npmdir="$pkgdir/usr/lib/node_modules/"
        mkdir -p "$_npmdir"
        cd "$_npmdir"
        npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}

md5sums=('fb5739bc97267a975507d290797e96b8')
