# Maintainer: 0x9fff00 <0x9fff00+git@protonmail.ch>
# Contributor: Florian Pritz <bluewind@xinu.at>
# Contributor: David McInnis <dave@dave3.xyz>
# Contributor: jyantis <yantis@yantis.net>

_name=internetarchive
pkgname=python2-$_name
pkgver=1.8.5
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
sha256sums=('dea42a8ebf6ba1f2eadb2b68ddcbadae9a4ce616077fa828529eebf1bc03ed5b')

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
