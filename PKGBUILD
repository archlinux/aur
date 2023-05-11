# Maintainer: Christopher Arndt <chris@chrisarndt.de>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>

pkgname=restview
pkgver=3.0.1
pkgrel=1
pkgdesc='A viewer for ReStructuredText documents that renders them on the fly'
arch=(any)
url='https://mg.pov.lt/restview/'
license=(GPL)
depends=(python-docutils python-pygments python-readme-renderer)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=("https://files.pythonhosted.org/packages/source/${pkgname:0:1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('8c1a171c159d46d15d5569f77021828883a121d6f9baf758d641fc1e54b05ae5')


build() {
  cd $pkgname-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
