# Maintainer: Pedro Lucas Porcellis <porcellis@eletrotupi.com>

pkgname=python-bottle-sqlite
pkgver=0.2.0
pkgrel=1
pkgdesc="SQLite3 integration for Bottle"
arch=(any)
url="https://pypi.org/project/bottle-sqlite"
license=("MIT")
makedepends=("python-setuptools")
depends=("python-bottle")
source=("https://pypi.python.org/packages/source/b/bottle-sqlite/bottle-sqlite-${pkgver}.tar.gz"
  "LICENSE::https://raw.githubusercontent.com/bottlepy/bottle-sqlite/master/LICENSE")
md5sums=('420b2aa22ad9528157dd3c0226b7dcc7'
         '1b079cfa6bdc0e9d814d2f6fa501fe6a')

package() {
  cd "${srcdir}/bottle-sqlite-${pkgver}"

  python setup.py install --root="$pkgdir/" --optimize=1

  install -Dm644 "../LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

