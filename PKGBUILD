# Maintainer: Ayatale <ayatale@qq.com>

pkgname=dature-cli
_pkgname=dature
pkgver=0.2.0
pkgrel=1
pkgdesc="A Crawler for Sina Blog, Based on Node.js"
arch=('any')
url="https://www.npmjs.com/package/$_pkgname"
license=('ISC')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/$_pkgname/-/$_pkgname-$pkgver.tgz)
noextract=($_pkgname-$pkgver.tgz)
sha256sums=('a1dfed8fa6a72bbbf0a812ffe74f7d999dec508068324bb0c35f28a24773678c')

package() {
    npm install -g "$srcdir/$_pkgname-$pkgver.tgz" \
        --prefix "$pkgdir/usr" \
        --cache "$srcdir/npm-cache"
    find "${pkgdir}/usr" -type d -exec chmod 755 {} +
    chown --recursive root:root "${pkgdir}"
}
