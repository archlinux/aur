# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>

pkgname=doitlive
pkgver=4.3.0
pkgrel=1
pkgdesc='Because sometimes you need to do it live'
arch=(any)
url=https://github.com/sloria/doitlive
license=(MIT)
depends=(python python-click-didyoumean python-click-completion python-shellingham)
makedepends=(python-setuptools)
source=(https://github.com/sloria/doitlive/archive/$pkgver.tar.gz)
sha512sums=('9151c642b231eb627729c7b46015578d45a5788ab0449377ee136754f6ea6e5db226d3b45b33b863b94bab4865a84ad4396e9cc779c39887cbd9cd353742b03a')

build() {
  cd $pkgname-$pkgver
  python setup.py build
}

package() {
  cd $pkgname-$pkgver
  python setup.py install -O1 --root="$pkgdir" --skip-build

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
