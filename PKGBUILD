# Maintainer: Frederick Gnodtke <fgnodtke at cronosx dot de>

pkgname=mopidy-subidy
pkgver=0.2.3
pkgrel=1
pkgdesc="Mopidy extension for playing music from Subsonic servers"
arch=('any')
url="https://github.com/Prior99/mopidy-subidy"
license=('BSD')
depends=(
    'mopidy>=2'
    'python2-pykka>=1.1'
    'python2-setuptools'
    'python2-pysonic>=0.5.1')
makedepends=('python2')
provides=('mopidy-subidy')
source=("https://github.com/prior99/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('8292df2f28686f72fcd1418d9e9873e8450688a161207f471e8df7b7cf5eff76')


package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
