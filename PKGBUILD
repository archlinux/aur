# Maintainer: Sebastiaan Lokhorst <sebastiaanlokhorst@gmail.com>

pkgname=fs2es-indexer
pkgver=0.3.0
pkgrel=2
arch=('any')
pkgdesc='File system indexer for Elasticsearch'
url='https://github.com/Ellerhold/fs2es-indexer'
depends=('python-elasticsearch' 'python-yaml')
makedepends=('python-setuptools' 'git')
backup=('etc/fs2es-indexer/config.yml')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Ellerhold/fs2es-indexer/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('7a8921ad858c9add46405ff0850b39ca1f2d2947025d09e382d5575d6bc2f9daea033cfc7357b901ed222c780d368db5965390036fad7127367ce72333a55b25')

build() {
  cd $pkgname-$pkgver
  python setup.py build
}

package() {
  cd $pkgname-$pkgver
  python setup.py install --root "$pkgdir" --optimize=1
  mkdir -p "$pkgdir/etc/fs2es-indexer"
  cp config.dist.yml "$pkgdir/etc/fs2es-indexer/config.yml"
}
