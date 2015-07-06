# Maintainer: David Scholl <djscholl at gmail dot com>
pkgname=python-pyaudio
pkgver=0.2.8
pkgrel=1
pkgdesc="Python bindings for PortAudio, the cross-platform audio I/O library"
arch=('i686' 'x86_64')
url="http://people.csail.mit.edu/hubert/pyaudio"
license=('MIT')
depends=('python' 'portaudio')
replaces=('pyaudio')
source=(http://people.csail.mit.edu/hubert/pyaudio/packages/pyaudio-$pkgver.tar.gz)
md5sums=('5c93a193224cca0183ec434dc558cff5')

build() {
  cd $srcdir/PyAudio-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/PyAudio-$pkgver
  python setup.py install --root=$pkgdir
  install -d $pkgdir/usr/share/licenses/$pkgname
  sed -n -e 17,40p README > $pkgdir/usr/share/licenses/$pkgname/COPYING
}
