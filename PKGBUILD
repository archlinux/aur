# Maintainer: M0Rf30

pkgname=friture-git
pkgver=v0.24.r0.g75e8cd8
pkgrel=1
pkgdesc="An application to visualize and analyze live audio data in real-time."
arch=(i686 x86_64)
url="http://tlecomte.github.com/friture/"
license=('GPL3')
depends=('pyqwt' 'python-scipy' 'python-psutil' 'python-pyaudio' 'python-opengl' 'python-pyqt5' 'python-sounddevice')
optdepends=('jack: for JACK I/O support')
makedepends=('cython')
source=("friture::git+https://github.com/tlecomte/friture.git")
md5sums=('866407aefd359ae16015f4ce6a2cd212')

build() {
  cd friture
  python setup.py build
}

package() {
  cd friture
  python setup.py install --root="$pkgdir/"
}

pkgver() {
  cd friture
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

md5sums=('SKIP')
