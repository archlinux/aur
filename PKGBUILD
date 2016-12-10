# Maintainer: M0Rf30

pkgname=friture-git
pkgver=1334.bad14c2
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
  python2 setup.py build
}

package() {
  cd friture
  python setup.py install --root="$pkgdir/"
}

pkgver() {
  cd friture
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

md5sums=('SKIP')
