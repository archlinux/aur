# Maintainer: Klemens Schölhorn <klemens@schoelhorn.eu>

pkgname=python2-wsgidav-seafile
pkgver=6.2.2
pkgrel=1
pkgdesc="Seafile webdav server"
arch=('any')
url="https://github.com/haiwen/seafdav"
license=('MIT')
depends=('python2'
         'python2-seafobj')
makedepends=('python2-setuptools')
conflicts=('python2-wsgidav')
source=("${url}/archive/v${pkgver}-server.tar.gz"
        "setup.py")
sha256sums=('11cd801d8e8aa1ea2511cad6e6aa2707387cd01f2b579c539d8bb0e9cf48a975'
            '3b265447a36918994bf3cbfaa318227c0b251c8d4ffca4f9d0aab2d1d7342b3d')

package() {
    cd "$srcdir/seafdav-$pkgver-server"
    python2 ../setup.py install --root="$pkgdir/" --optimize=1

    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
