# Maintainer: Markus Kitsinger (SwooshyCueb) <root@swooshalicio.us>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python2-attrs
pkgver=21.4.0
pkgrel=1
pkgdesc="Attributes without boilerplate. (Python 2)"
arch=('any')
license=('MIT')
url="https://attrs.readthedocs.org/"
depends=('python2')
makedepends=('python2-setuptools')
source=("https://pypi.io/packages/source/a/attrs/attrs-$pkgver.tar.gz")
sha512sums=('5a52776eb505c8a354912fa037a9710e49830fa6ad37272cb6d8c3298f4179a5b237e36cd7db3b1c9af19fbf0194ad6b83c3db9a473f9349769180073273ba65')

build() {
  cd "$srcdir"/attrs-$pkgver
  python2 setup.py build
}

package() {
  cd attrs-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
