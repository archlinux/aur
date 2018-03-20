# Maintainer: Fabio Rämi <fabio[at]dynamix-tontechnik[dot]ch>
# Contributor: speps <speps at aur dot archlinux dot org>

pkgname=friture
pkgver=0.34
pkgrel=1
pkgdesc="An application to visualize and analyze live audio data in real-time."
arch=(i686 x86_64)
url="http://tlecomte.github.com/friture/"
license=('GPL3')
depends=('pyqwt' 'python-scipy' 'python-psutil' 'python-pyaudio' 'python-opengl' 'python-pyqt5' 'python-sounddevice' 'python-pyrr')
optdepends=('jack: for JACK I/O support')
makedepends=('cython' 'dos2unix')
source=("https://github.com/tlecomte/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('f7bef94e16440190b6f96d5502d58956926fb964af677289b86acb78f9adf82e')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/"
}

# vim:set ts=2 sw=2 et:
