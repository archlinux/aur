# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=plastex  
pkgver=3.0
pkgrel=1
pkgdesc="Python-based LaTeX document processing framework."
url="https://github.com/$pkgname/$pkgname"
arch=('any')
license=('custom')
depends=('python' 'texlive-core')
source=("$pkgname-$pkgver.tar.gz::https://github.com/$pkgname/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('abf4dfa3b9c4cc6e08dab800422635f005fae5b25cc2fe41e496d142fde57acd')

package() {
  cd $pkgname-$pkgver
  python setup.py install --root=$pkgdir/ 
  install -D -m644 "$srcdir"/$pkgname-$pkgver/LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE 
  for _i in  "$srcdir"/$pkgname-$pkgver/licenses/*
  do 
    install -D -m644 ${_i} "$pkgdir"/usr/share/licenses/$pkgname/${_i}
  done
}
