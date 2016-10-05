# Maintainer: Kyle Keen <keenerd@gmail.com>

pkgname=coconut-lang
_name=coconut
pkgver=1.2.0
pkgrel=1
pkgdesc="Simple, elegant, Pythonic functional programming."
arch=('any')
url="http://coconut-lang.org/"
license=('Apache')
depends=('python' 'python-pyparsing' 'python-prompt_toolkit' 'python-pygments')
source=(https://github.com/evhub/coconut/archive/v$pkgver.tar.gz)
md5sums=('1938cd5b997b1a607bd4ca6f2891aaae')

prepare() {
  cd "$srcdir/$_name-$pkgver"
  # hardcoded versions suck
  sed -i 's/==.*$//' reqs/requirements{,-non-py26}.txt
}

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir"
}


