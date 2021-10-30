# Maintainer: kiasoc5 <kiasoc5 at tutanota dot com>
# Contributor: xantares

pkgname=stargate
pkgver=21.10.9
pkgrel=1
pkgdesc="A digital audio workstation (DAW) with a powerful pattern-based workflow"
license=('GPL')
arch=('x86_64')
url="https://stargateaudio.github.io/"
depends=('python-pyqt5' 'fftw' 'libsndfile' 'portaudio' 'portmidi' 'python-mido')
makedepends=('cython' 'jq' 'python-pip')
source=("https://github.com/stargateaudio/stargate/archive/refs/tags/release-${pkgver}.tar.gz")
sha256sums=('c5c22b03787b192431a830eb9a20cdd5e2295d5b70ec270096e7fc098b1f58ad')

build() {
  cd stargate-release-$pkgver
  cd src
  make
}

package() {
  cd stargate-release-$pkgver
  cd src
  PREFIX=${pkgdir}/usr make install
}
