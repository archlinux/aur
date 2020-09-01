# Maintainer: Carlo Capocasa <carlo@capocasa.net>
# Maintainer: Peter Sutton <peter@foxdogstudios.com>
# Contributor: amiguet <contact at matthieuamiguet dot ch>
# Based on python2-pyo by amiguet

pkgname=python-pyo
pkgver=1.0.3
pkgrel=1
pkgdesc='Python DSP module'
arch=('x86_64')
url="http://ajaxsoundstudio.com/software/pyo/"
license=('GPL')
depends=('python' 'portmidi' 'portaudio' 'liblo' 'libsndfile')
makedepends=('python-setuptools')
optdepends=('wxpython: wxWidgets GUI')
provides=("pyo=$pkgver" "python-pyo=$pkgver")
conflicts=('pyo')
source=("https://codeload.github.com/belangeo/pyo/tar.gz/$pkgver")
sha512sums=('2c6dccb53c0bf895c4177d441d72e75b8df60f0004753a380f54c461c80d0e6c07ba117adcbf5e6e5faddd7b155b7e92ff1a26c8a7a0ab36c1d81324a4f0da99')

build() {
  cd "$srcdir"/pyo-"$pkgver"
  python setup.py build --use-double --use-jack
}

package() {
  cd "$srcdir"/pyo-"$pkgver"
  python setup.py install --use-double --use-jack --root="$pkgdir"/
}
