# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=python38-pkgconfig
pkgver=1.5.5
pkgrel=3
pkgdesc='Python module to interface with the pkg-config command line tool'
arch=(any)
url='https://github.com/matze/pkgconfig'
license=(MIT)
depends=(python38)
makedepends=(python38-setuptools)
source=(https://pypi.io/packages/source/p/pkgconfig/pkgconfig-$pkgver.tar.gz)
sha256sums=('deb4163ef11f75b520d822d9505c1f462761b4309b1bb713d08689759ea8b899')

package() {
  cd pkgconfig-$pkgver
  
  python3.8 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
