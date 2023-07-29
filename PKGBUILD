# Maintainer: Matt Cuneo <m@cuneo.au>
pkgname=lemmony
pkgver=0.0.6
pkgrel=1
pkgdesc="A better 'All' browsing experience for Lemmy instances"
arch=('any')
url="https://github.com/jheidecker/$pkgname"
license=('MIT')
depends=('python-certifi' 'python-charset-normalizer' 'python-idna' 'python-requests' 'python-urllib3')
makedepends=(python-build python-installer)
source=("https://github.com/jheidecker/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('bbe33998db953129f032e99d1387e7969dbc9fa18d661a71a5365ee2bb562455')

build() {
  cd $pkgname-$pkgver
  python -m build
}
package() {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
