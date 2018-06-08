# Maintainer: robertfoster
# Contributor: Håvard Pettersson <mail@haavard.me>

pkgbase=python-sounddevice
pkgname=(python-sounddevice python2-sounddevice)
pkgver=0.3.11
pkgrel=1
pkgdesc='Play and Record Sound with Python'
url='http://python-sounddevice.rtfd.io/'
license=('MIT')
arch=('any')
depends=('portaudio' 'python' 'python-cffi')
makedepends=('python-setuptools' 'python2-setuptools')
optdepends=('python-numpy: to play back and record NumPy arrays')
source=("https://files.pythonhosted.org/packages/source/s/sounddevice/sounddevice-$pkgver.tar.gz")

build() {
  cd $srcdir
  cp -a sounddevice-$pkgver sounddevice2-$pkgver
}

package_python-sounddevice() {
  cd $srcdir/sounddevice-$pkgver
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python2-sounddevice() {
  depends=('portaudio' 'python2' 'python2-cffi')
  optdepends=('python2-numpy: to play back and record NumPy arrays')

  cd $srcdir/sounddevice2-$pkgver
  python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

md5sums=('e40927c78366d4503413f4d6f62be23e')
