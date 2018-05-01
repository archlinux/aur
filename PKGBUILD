# Maintainer: Dimitrios Vogiatzis <me@dimtree.net>

pkgname=python-plexapi
pkgver=3.0.6
pkgrel=1
pkgdesc="Python bindings for the Plex API."
arch=('any')
url="https://github.com/pkkid/python-plexapi"
license=('BSD')
depends=('python-requests'
         'python-tqdm'
         'python-websocket-client')
makedepends=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/pkkid/python-plexapi/archive/$pkgver.tar.gz")
sha256sums=('d43947afb640d47a12525fea24c9d9e1afc80e7fbc7991666184bd942dae130d')

package() {
    cd "$pkgname-$pkgver"
    python ./setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
