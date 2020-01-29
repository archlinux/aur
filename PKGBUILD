# Maintainer: mitts <mittens2001@opmbx.org>

pkgname=mopidy-gmusic
pkgver=4.0.0
pkgrel=1
pkgdesc="Mopidy extension for playing music from Google Play Music"
arch=('any')
url="https://github.com/mopidy/mopidy-gmusic"
license=('APACHE')
depends=('python-setuptools' 'mopidy>=3.0.0' 'python-pykka>=2.0.1' 'python-gmusicapi>=12.1.1-2'
         'python-requests>=2.0' 'python-cachetools>=1.0.0')
makedepends=('python-setuptools')
source=("https://github.com/mopidy/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('1b71a9cf31721aa8d3dd5954c44128f3')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
