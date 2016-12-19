pkbase=python-speechrecognition
pkgname=('python-speechrecognition' 'python2-speechrecognition')
_pkgname=speech_recognition
pkgver=3.5.0
pkgrel=1
pkgdesc="Google-powered speech recognition for Python"
arch=('i686' 'x86_64')
url="https://github.com/Uberi/speech_recognition"
license=('MIT')
source=(https://github.com/Uberi/speech_recognition/archive/${pkgver}.tar.gz)
md5sums=('7ce812588cadb2e721c5db62a48c5ecb')

prepare () {
  cp -r "$srcdir"/$_pkgname-$pkgver "$srcdir"/$_pkgname-$pkgver-py2
}

build() {
  cd $srcdir/$_pkgname-$pkgver
  python setup.py build

  cd $srcdir/$_pkgname-$pkgver-py2
  python2 setup.py build
}

package_python-speechrecognition() {
  depends=('python')
  cd $srcdir/$_pkgname-$pkgver
  python setup.py install --root=$pkgdir --optimize=1
}

package_python2-speechrecognition() {
  depends=('python2')
  cd $srcdir/$_pkgname-$pkgver-py2
  python2 setup.py install --root=$pkgdir --optimize=1
}
