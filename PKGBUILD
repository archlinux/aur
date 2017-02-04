# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgbase=python-pydub
pkgname=('python-pydub' 'python2-pydub')
pkgver=0.17.0
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

sha1sums=('2d4884ed8cf994b85e8eb9b30919f6826dd1b7a4')
sha256sums=('437e18c141ed0bebb1cf875f9b93bd8830a1e7772000a4cf0d61103169e1917f')
sha512sums=('a834a1b8e18503d8026eb86afba87c61967fd1c5a98bff389d80656191df81b02145f91d14baaf1aa388a3f251b2720ead2e0eb64889c0b809c568dbe7e5d6eb')
