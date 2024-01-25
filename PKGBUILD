# Maintainer: iamawacko <iamawacko@protonmail.com>
# Contributor: Sven-Hendrik Haase <svenstaro@gmail.com>

pkgname=doitlive
pkgver=5.0.0
pkgrel=1
pkgdesc='Because sometimes you need to do it live'
arch=(any)
url=https://github.com/sloria/doitlive
license=(MIT)
depends=(python python-click-didyoumean python-click-completion python-shellingham)
makedepends=(python-setuptools)
source=(https://github.com/sloria/doitlive/archive/$pkgver.tar.gz)
sha512sums=('0da997fcd9ba1d784ebe61b8a7753cf3cb0e951933d0358728943576c65665a5968c0f4bb2f7853df95bdca3558e3baff1e742920cef44ae36f1c51ff506408f')

build() {
  cd $pkgname-$pkgver
  python setup.py build
}

package() {
  cd $pkgname-$pkgver
  python setup.py install -O1 --root="$pkgdir" --skip-build

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
