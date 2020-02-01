# Maintainer: Frederick Gnodtke <fgnodtke at cronosx dot de>

pkgname=mopidy-subidy
pkgver=0.4.1
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
sha256sums=('705f906ca26312e5f3111b7ff332b4d3714e0c03eb120a612ca6f40ed0b7af26')


package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
