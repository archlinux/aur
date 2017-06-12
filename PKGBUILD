# Maintainer: Frederick Gnodtke <fgnodtke at cronosx dot de>

pkgname=mopidy-subidy
pkgver=0.3.4
pkgrel=1
pkgdesc="Mopidy extension for playing music from Subsonic servers"
arch=('any')
url="https://github.com/Prior99/mopidy-subidy"
license=('BSD')
depends=(
    'mopidy>=2'
    'python2-pykka>=1.1'
    'python2-setuptools'
    'python2-pysonic>=0.6.1')
makedepends=('python2')
provides=('mopidy-subidy')
source=("https://github.com/prior99/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('1c12bb553abe001fa109f3311ddffc24ef84b7770a7920d91622bd39cfe1cd84')


package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
