# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=wispr
pkgver=1.0
pkgrel=1
pkgdesc="Simple command-line tool to authenticate against a WISPr server"
url="https://github.com/wichert/wispr"
arch=('any')
license=('custom')
depends=('python')
source=('https://github.com/wichert/wispr/archive/release/1.0.tar.gz')
sha256sums=('ba9994abee90d51c9d65fbb61241694a610a0198c5c4a833f8d7bf9c346ebd41')

build() {
    cd "wispr-release-$pkgver"
    python setup.py build
}

package() {
    cd "wispr-release-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
