# Maintainer: David Scholl <djscholl at gmail dot com>
pkgname=python2-pyaudio
pkgver=0.2.9
pkgrel=2
pkgdesc="Python bindings for PortAudio, the cross-platform audio I/O library"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="http://people.csail.mit.edu/hubert/pyaudio"
license=('MIT')
depends=('portaudio' 'python2-setuptools')
replaces=('pyaudio')
source=(https://pypi.python.org/packages/source/P/PyAudio/PyAudio-$pkgver.tar.gz)
md5sums=('6d91aae842c7000d2921815e286801fd')

build() {
  cd $srcdir/PyAudio-$pkgver
  python2 setup.py build
}

package() {
  cd $srcdir/PyAudio-$pkgver
  python2 setup.py install --root=$pkgdir
  install -d $pkgdir/usr/share/licenses/$pkgname
  sed -n -e 17,40p README > $pkgdir/usr/share/licenses/$pkgname/COPYING
}
