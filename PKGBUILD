# Maintainer: Leonid Lednev <leonidledn at gmail dot com>
_name=dploot
pkgname="python-$_name"
pkgver=3.2.2
pkgrel=1
pkgdesc="DPAPI looting remotely in Python"
arch=(any)
url="https://github.com/zblurx/$_name"
license=('MIT')
depends=(
  'python>=3.10'
  'impacket>=0.12.0'
  'python-cryptography>=40.0.1'
  'python-pyasn1>=0.4.8'
  'python-lxml>=5.0'
)
makedepends=(
  'python-build'
  'python-wheel'
  'python-installer'
  'python-poetry-core>=1.0.0'
)
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
b2sums=('0d9a5492e190536921195885f1b4a3343f96a52186bdbb17f2a6cbd54d895eb16d25524d3447525b318daa6ce35872264234e497086b075a3bade5d145c79356')

build() {
  cd "$_name-$pkgver"
  python -m build -wnx
}

package() {
  cd "$_name-$pkgver"
  python -m installer -d "$pkgdir/" dist/*.whl
  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2 sw=2 et:
