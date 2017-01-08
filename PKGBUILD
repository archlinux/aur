pkgname=spectrumyzer
pkgver=1.1.1
pkgrel=1
pkgdesc="Spectrum analyzer rendered on a desktop"
arch=('x86_64' 'i686')
url="https://github.com/HaCk3Dq/spectrumyzer"
license=('GPL')
depends=('python' 'cairo' 'python-cairo' 'python-gobject' 'fftw' 'libpulse')
makedepends=('git')
optdepends=()
provides=("$pkgname")
conflicts=()

source=("git+https://github.com/HaCk3Dq/spectrumyzer")
md5sums=('SKIP')

_gitname=spectrumyzer

build() {
  cd "$srcdir/$_gitname"
  make
}

package() {
  cd "$srcdir/$_gitname"
  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/lib/python3.6"
  mkdir -p "${pkgdir}/usr/share/applications"
  mkdir -p "${pkgdir}/usr/share/spectrumyzer"
  cp spectrumyzer.py "${pkgdir}/usr/bin/spectrumyzer"
  cp impulse.so "${pkgdir}/usr/lib/python3.6/impulse.so"
  cp spectrumyzer-toggle "${pkgdir}/usr/bin/spectrumyzer-toggle"
  cp spectrumyzer.desktop "${pkgdir}/usr/share/applications/spectrumyzer.desktop"
  cp config "${pkgdir}/usr/share/spectrumyzer/config"
}
