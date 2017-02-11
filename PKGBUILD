# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgbase=python-pydub
pkgname=('python-pydub' 'python2-pydub')
pkgver=0.18.0
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

sha1sums=('15a098790940435ddef3faa40009576e7384f1c3')
sha256sums=('d3ec8fe0474b26d5088a59888eda85b8267da21fb7d066485b1d77daf3b68ffb')
sha512sums=('a39256b320a517d968d84eaf7e5666e362120e3be8ba97e8a08035900957334a2f8c13085175a01e2f2fa56336846557a4a5dcf23dc9a9e1abfb8688858e8477')
