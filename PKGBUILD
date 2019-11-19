# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=plastex  
pkgver=2.0
pkgrel=1
pkgdesc="Python-based LaTeX document processing framework."
url="http://tiarno.github.io/plastex/"
arch=('any')
license=('custom')
depends=('python' 'texlive-core')
source=("$pkgname-$pkgver.tar.gz::https://github.com/$pkgname/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('c07d46059aa940197205749c02ebafaee88b1f02c0efa3e608015f21ef3895d5')

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
