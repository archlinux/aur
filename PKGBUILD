# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgbase=python-pydub
pkgname=('python-pydub' 'python2-pydub')
pkgver=0.16.6
pkgrel=1
pkgdesc="Manipulate audio with an simple and easy high level interface"
url="http://pydub.com"
license=('MIT')
arch=('any')
source=("https://github.com/jiaaro/pydub/archive/v$pkgver.tar.gz")

build() {
  cd $srcdir
  cp -r pydub-$pkgver pydub2-$pkgver
}

check() {
  cd $srcdir/pydub-$pkgver
  which python3 && python3 setup.py check

  cd $srcdir/pydub2-$pkgver
  which python2 && python2 setup.py check
}

package_python-pydub() {
  depends=('python' 'python-setuptools')
  cd $srcdir/pydub-$pkgver
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python2-pydub() {
  depends=('python2' 'python2-setuptools')
  cd $srcdir/pydub2-$pkgver
  python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha1sums=('2917ca7b99b3238e548406cfe878dd52b42f8a45')
sha256sums=('1d178f4e10b25246533f8371af55e0adaae615464a96baac7fc2b0b38ad0d35c')
sha512sums=('95d6690580a2bf5b1fe1575513e562fbfcc45aeea67d8e60226e0e1ce800b13b7816501923fea7543382975472232077ba0d7f86ff0c5a1ce1e2b7d5551b2169')
sha1sums=('f3bbfc95419d5ca87715193e20b370c6a474a64b')
sha256sums=('41bfc2dbea646b6fe05942273a7231729d2c774c93d18278124a0a294e385a46')
sha512sums=('59e957fc8c9b8c705341b18aaff554e3cc5f9f9fa3c9ea64696e84cb83ab9d0d63b9af0332f00dd9e749cf74814f7462723c999a778e540206d0910449c631c0')
