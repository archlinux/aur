# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=plastex  
pkgver=1.0.0
pkgrel=1
pkgdesc="Python-based LaTeX document processing framework."
url="http://tiarno.github.io/plastex/"
arch=('any')
license=('custom')
depends=('python2' 'texlive-core')
source=("$pkgname-$pkgver.tar.gz::https://github.com/tiarno/plastex/archive/1.0.0.tar.gz")
md5sums=('d8bb2af18e4a7e8852e7c1d8e70154ad')

package() {
  cd $srcdir/$pkgname-$pkgver
  python2 setup.py install --root=$pkgdir/ 
  install -D -m644 $srcdir/$pkgname-$pkgver/LICENSE \
    $pkgdir/usr/share/licenses/$pkgname/LICENSE 
  for _i in  $srcdir/$pkgname-$pkgver/licenses/*
  do 
    install -D -m644 ${_i} $pkgdir/usr/share/licenses/$pkgname/${_i}
  done
}
