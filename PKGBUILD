# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: Jakub Klinkovský <j.l.k@gmx.com>

pkgname=python-simplemediawiki
pkgdesc="Extremely low-level wrapper to the MediaWiki API"
pkgver=1.2.0_b2
pkgrel=12
arch=('any')
url="https://github.com/ianweller/python-simplemediawiki"
license=('LGPL')
depends=('python')
makedepends=(python-build python-installer python-wheel python-setuptools)
source=("$pkgname-$pkgver.tar.gz::https://github.com/ianweller/python-simplemediawiki/archive/${pkgver/_/}.tar.gz")
sha256sums=('417d17d65c7f6b94519a4f6b7fc2ec7cee2b5ee7a0515e19b3e4bf30c55904a8')

build() {
  cd "python-simplemediawiki-${pkgver/_/}"
  python -m build --wheel --no-isolation
}

package() {
  cd "python-simplemediawiki-${pkgver/_/}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
