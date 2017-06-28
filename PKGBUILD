# Maintainer: Daniel M. Capella <polyzen@archlinux.info>

pkgname=instagram-scraper
pkgver=1.5.0
pkgrel=1
pkgdesc="Scrapes and downloads an instagram user's photos and videos"
arch=('any')
url=https://github.com/rarcega/instagram-scraper
license=('custom:Public domain')
depends=('python-requests' 'python-tqdm')
makedepends=('python-setuptools')
checkdepends=('python-nose' 'python-requests-mock')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('7db7d38cf8422f88f29796cd8fbea21187dabb802002bf2905b029f7900356a5df6272936b1e1057fc698ef3dc3ce65a087499534853cfc03af71ec866d96aef')

prepare() {
  cd $pkgname-$pkgver
  sed -i '7,8d' setup.py # https://github.com/rarcega/instagram-scraper/pull/72
}

check() {
  cd $pkgname-$pkgver
  python setup.py test
}

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
