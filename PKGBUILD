# Maintainer: Nick77 <qwiko20@tutamail.com>
pkgname=jakana
pkgver=0.2.1
pkgrel=1
pkgdesc='learn Japanese kana on cli'
arch=('any')
url='https://github.com/Catalina-sys456/jakana'
license=('MIT')
depends=('python')
makedepends=(python-build
	     python-installer
	     python-wheel
	     python-hatchling)
source=(        
  $pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('42f5e17d7d996b6ca62e3beef02af007eae15af9a04c571f27c6ccea68da9d0760e55e3f6311b7bbbcc37332dbb647f996e7041e4e167d2510e430f0e1b5a6b1')

build() {
    cd $pkgname-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
}
