# Maintainer: mitts <mittens2001@opmbx.org>

pkgname=mopidy-gmusic
pkgver=3.0.0
pkgrel=1
pkgdesc="Mopidy extension for playing music from Google Play Music"
arch=('any')
url="https://github.com/mopidy/mopidy-gmusic"
license=('APACHE')
depends=('python2-setuptools' 'mopidy>=1.0.0' 'python2-pykka>=1.1.0' 'python2-gmusicapi>=10.1.0'
         'python2-requests>=2.0' 'python2-cachetools>=1.0.0')
makedepends=('python2-setuptools')
source=("https://github.com/mopidy/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('6c95f059dfd8189f259c67e517adc38b')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python2 setup.py install --root="$pkgdir/" --optimize=1

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
