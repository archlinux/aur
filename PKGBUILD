pkgname=angular-cli
pkgver=8.3.19
pkgrel=1
pkgdesc="CLI tool for Angular"
arch=(any)
url="https://github.com/angular/angular-cli"
license=(MIT)
depends=('nodejs' 'npm')
options=(!strip)

package() {

    _npmscope=@angular
    _npmname=cli
    _npmver=$pkgver

    npm install -g --prefix "$pkgdir/usr" $_npmscope/$_npmname@$_npmver
    # Non-deterministic race in npm gives 777 permissions to random directories.
    # See https://github.com/npm/npm/issues/9359 for details.
    find "${pkgdir}"/usr -type d -exec chmod 755 {} +
}

