# Contributor: jnanar <info@agayon.be>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=python-shortuuid
pkgver=1.0.0
pkgrel=1
pkgdesc="shortuuid is a simple python library that generates concise, unambiguous, URL-safe UUIDs."
arch=('any')
url="https://github.com/skorokithakis/shortuuid"
license=('custom:BSD')
depends=('python')
options=(!emptydirs)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/v$pkgver.tar.gz")
sha256sums=('cc2539aaed1b4de34853ee4aaf8331176b768a2d3a87d5a790453e082ce36850')

package() {
  cd ${pkgname#python-}-$pkgver
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
