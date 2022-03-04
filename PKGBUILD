# Maintainer: Kyle Keen <keenerd@gmail.com>

pkgname=coconut-lang
_name=coconut
pkgver=1.6.0
pkgrel=1
pkgdesc="Simple, elegant, Pythonic functional programming."
arch=('any')
url="http://coconut-lang.org/"
license=('Apache')
depends=('python' 'python-pyparsing' 'python-prompt_toolkit' 'python-pygments')
source=($pkgname-$pkgver.tgz::https://github.com/evhub/coconut/archive/v$pkgver.tar.gz)
md5sums=('4c3be8c88497319d6f8f29203d723aab')

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir"
}


