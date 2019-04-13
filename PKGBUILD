# Maintainer: 0x9fff00 <0x9fff00+git@protonmail.ch>
# Contributor: Florian Pritz <bluewind@xinu.at>
# Contributor: David McInnis <dave@dave3.xyz>
# Contributor: jyantis <yantis@yantis.net>

_name=internetarchive
pkgname=python2-$_name
pkgver=1.8.4
pkgrel=1
pkgdesc="Wrapper for the various Internet Archive APIs (IA-S3, Metadata API, etc)"
arch=('any')
url="https://github.com/jjjake/internetarchive"
license=('AGPL3')
depends=('python2' 'python2-backports.csv' 'python2-clint' 'python2-docopt' 'python2-jsonpatch' 'python2-requests' 'python2-schema' 'python2-six')
makedepends=('python2-setuptools')
optdepends=('python2-ujson: faster json parsing'
            'python2-gevent: concurrent downloads'
            'cython2: speedups')
checkdepends=('python2-responses' 'python2-pytest')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jjjake/internetarchive/archive/v$pkgver.tar.gz")
sha256sums=('8825285164e1ccd33bbd4bcb04411f360c3023adff3359adcf658b37441de6a8')

build() {
  cd "$_name-$pkgver"

  python2 setup.py build
}

check() {
  cd "$_name-$pkgver"

  python2 setup.py test
}

package() {
  cd "$_name-$pkgver"

  python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
