# Maintainer: Aaron DeVore <aaron.devore@gmail.com>

pkgname=wok
pkgver=1.1.1
pkgrel=2
pkgdesc="Static site generator"
url="http://wok.mythmon.com"
depends=('python2' 'python2-yaml' 'python2-jinja' 'python2-markdown' 'python2-docutils'
         'python2-pygments' 'python2-slugify')
makedepends=('python2-setuptools')
license=('MIT')
arch=('any')
source=("http://pypi.python.org/packages/source/w/wok/wok-$pkgver.tar.gz"
  LICENSE)
md5sums=('a39df2325317daec09061f983522aca4'
         '5c9c57db8a21e4fbe3298502f58a4cd0')

build() {
    cd "$srcdir/wok-$pkgver"
    python2 setup.py build
}

package() {
    cd "$srcdir/wok-$pkgver"
    install -D -m644 "$srcdir/LICENSE" \
      "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    python2 setup.py install --root="$pkgdir" --optimize=1 
}
