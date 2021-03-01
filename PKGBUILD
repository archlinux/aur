# Maintainer: Timothy Redaelli <timothy.redaelli@gmail.com>

pkgname=python-rocksdb
pkgver=0.7.0
pkgrel=1
pkgdesc="Python bindings for RocksDB"
arch=(any)
url="https://github.com/twmht/python-rocksdb"
license=(BSD License)
makedepends=("python" "python-pip")
depends=("rocksdb")
build() {
  pip install --no-deps --target="python-rocksdb" python-rocksdb==$pkgver
}
package() {
  sitepackages=$(python -c "import site; print(site.getsitepackages()[0])")
  mkdir -p $pkgdir/"$sitepackages"
  cp -r $srcdir/python-rocksdb/* $pkgdir/"$sitepackages"
}
