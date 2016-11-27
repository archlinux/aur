# Maintainer: mitts <mittens2001@opmbx.org>

pkgname=mopidy-local-images
pkgver=1.0.0
pkgrel=2
pkgdesc="Mopidy local library proxy extension for handling embedded album art"
arch=('any')
url="https://github.com/mopidy/mopidy-local-images"
license=('APACHE')
depends=('python2-pykka>=1.1.0' 'mopidy>=1.1.0' 'python2-uritools>=1.0')
makedepends=('python2' 'python2-setuptools')
source=("https://github.com/mopidy/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('5b209aa86a9598710cd892d2947538a9')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python2 setup.py install --root="$pkgdir/" --optimize=1

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
