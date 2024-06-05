# Maintainer: iamawacko <iamawacko@protonmail.com>
# Contributor: Sven-Hendrik Haase <svenstaro@gmail.com>

pkgname=doitlive
pkgver=5.1.0
pkgrel=1
pkgdesc='Because sometimes you need to do it live'
arch=(any)
url=https://github.com/sloria/doitlive
license=(MIT)
depends=(python python-click-didyoumean python-click-completion python-shellingham)
makedepends=(python-setuptools)
source=(https://github.com/sloria/doitlive/archive/$pkgver.tar.gz)
sha512sums=('2e502b74835b71ad385c5752d3a2c7c1bc51d1332677fea6ba2966e832438c550d818ca3ed40713e24a9bec2442cc1dcfb0977b111186be95dbb2b87cf48acce')

build() {
  cd $pkgname-$pkgver
  python setup.py build
}

package() {
  cd $pkgname-$pkgver
  python setup.py install -O1 --root="$pkgdir" --skip-build

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
