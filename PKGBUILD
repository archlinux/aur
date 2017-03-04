# Maintainer: Frederick Gnodtke <fgnodtke at cronosx dot de>

pkgname=mopidy-subidy
pkgver=0.2.6
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
sha256sums=('771cf58a6f36872f6a9c45866b2a4d27459cf2ea460a84d34257818bfe815c77')


package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
