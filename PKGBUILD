# Maintainer: Fabio Rämi <fabio[at]dynamix-tontechnik[dot]ch>
# Contributor: speps <speps at aur dot archlinux dot org>

pkgname=friture
pkgver=0.27
pkgrel=1
pkgdesc="An application to visualize and analyze live audio data in real-time."
arch=(i686 x86_64)
url="http://tlecomte.github.com/friture/"
license=('GPL3')
depends=('pyqwt' 'python-scipy' 'python-psutil' 'python-pyaudio' 'python-opengl' 'python-pyqt5' 'python-sounddevice')
optdepends=('jack: for JACK I/O support')
makedepends=('cython' 'dos2unix')
source=("https://github.com/tlecomte/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('6f39352b3f2a1cb4dfd4ecd48df5bd1826f1a3fd776b724d7b7b95a80c01adff')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/"
}

# vim:set ts=2 sw=2 et:
