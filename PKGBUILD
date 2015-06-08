
pkgname=dr14_tmeter
pkgver=1.0.16
pkgrel=1
pkgdesc="Compute the dynamic range DR14 value of the givens audio files"
arch=(any)
license=('GPL3')
url="http://dr14tmeter.sourceforge.net"
depends=('python' 'flac' 'lame' 'faad2' 'ffmpeg' 'vorbis-tools' 'python-numpy' )
optdepends=('python-matplotlib: plot support for python' 'python-scipy: dyn compression ' )

source=("http://sourceforge.net/projects/dr14tmeter/files/dr14tmeter-${pkgver}/dr14tmeter-${pkgver}.tar.gz")
sha1sums=('5f8552fd9576f1bbc3e9ca0519182df5b7fdb86d')

build() {
  cd "$srcdir/dr14tmeter-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/dr14tmeter-$pkgver"
  echo ${pkgdir}
  python setup.py install --root=${pkgdir} --prefix=usr --optimize=1
}
