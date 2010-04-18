# Maintainer: Aaron Schaefer <aaron@elasticdog.com>
pkgname=python-boto
pkgver=1.9b
pkgrel=1
pkgdesc='A Python interface to Amazon Web Services (AWS)'
arch=('any')
url='http://code.google.com/p/boto/'
license=('MIT')
depends=('python')
source=("http://boto.googlecode.com/files/boto-$pkgver.tar.gz" 'LICENSE')
md5sums=('4fc2fd7b70a971b1363f8465aafe7091'
         '35ebd993c05c79ba78e9f4fb3e65e547')

build() {
  cd "$srcdir/boto-$pkgver"

  python setup.py install --root="$pkgdir" || return 1
  install -D -m644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
