# Maintainer: Kyle Keen <keenerd@gmail.com>

pkgname=coconut-lang
_name=coconut
pkgver=1.0.0
pkgrel=1
pkgdesc="Simple, elegant, Pythonic functional programming."
arch=('any')
url="http://coconut-lang.org/"
license=('Apache')
depends=('python' 'python-pyparsing')
source=(https://github.com/evhub/coconut/archive/v$pkgver.tar.gz)
md5sums=('ce9618008633ce0c4b0bc1f54b5834bb')

prepare() {
  cd "$srcdir/$_name-$pkgver"
  # hardcoded versions suck
  sed -i 's/"pyparsing==.*"/"pyparsing"/' setup.py
}

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir"
}


