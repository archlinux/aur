# Maintainer: Miodrag Tokić
# Contributor:  Marcin Wieczorek <marcin@marcin.co>
# Contributor: Stefan Tatschner <rumpelsepp@sevenbyte.org>

pkgname=git-ftp
pkgver=1.6.0
pkgrel=1
pkgdesc='Uses Git to upload only changed files to FTP servers'
arch=('any')
url='https://github.com/git-ftp/git-ftp'
license=('GPL')
depends=('curl' 'git')
makedepends=('pandoc')

source=("$pkgname-$pkgver.tar.gz::https://github.com/git-ftp/git-ftp/archive/$pkgver.tar.gz")
sha256sums=('088b58d66c420e5eddc51327caec8dcbe8bddae557c308aa739231ed0490db01')

build() {
    cd "$pkgname-$pkgver/man"
    make man
}

package() {
    cd "$pkgname-$pkgver"
    install -D -m 755 git-ftp "$pkgdir/usr/bin/git-ftp"
    install -D -m 644 man/git-ftp.1 "$pkgdir/usr/share/man/man1/git-ftp.1"
}
