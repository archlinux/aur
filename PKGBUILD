#Maintainer='Gilles Hamel <hamelg@laposte.net>'
#Contributor=SecByShresth <Shresthpaul133@gmail.com>
pkgname=python-whisper
pkgver=1.1.10
pkgrel=3
pkgdesc='Fixed-size database that provides fast, reliable storage of numeric data over time.'
arch=('any')
url='https://github.com/graphite-project/whisper'
license=('Apache')
depends=('python' 'python-six' 'python-configobj')
optdepends=('rrdtool: for rrd2whisper.py support')
conflicts=('python2-whisper')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
options=(!emptydirs)
source=($pkgname-$pkgver.tar.gz::"https://github.com/graphite-project/whisper/archive/$pkgver.tar.gz")
sha256sums=('f6535b4e73766ea745606f8a9b16080efa69e5756cda5f7b9d1457dd9515d99a')


build() {
  cd "whisper-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "whisper-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
