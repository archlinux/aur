pkgname=moro
pkgver=5.1.0
pkgrel=1
pkgdesc="A command line tool for tracking work hours."
arch=(any)
url="https://github.com/omidfi/moro"
license=('MIT')
depends=('nodejs')
makedepends=('npm')

package() {
    npm install -g --prefix "$pkgdir/usr" $pkgname@$pkgver
    # Non-deterministic race in npm gives 777 permissions to random directories.
    # See https://github.com/npm/npm/issues/9359 for details.
    find "${pkgdir}"/usr -type d -exec chmod 755 {} +
}
