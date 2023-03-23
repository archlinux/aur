# Maintainer: Carlo Capocasa <carlo@capocasa.net>
# Maintainer: Peter Sutton <peter@foxdogstudios.com>
# Contributor: amiguet <contact at matthieuamiguet dot ch>
# Based on python2-pyo by amiguet

pkgname=python-pyo
pkgver=1.0.5
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
sha512sums=('4e48c255d87d61017b4f74ffa8e80af26964fc2948b0376ed638a773c5cc36e12e2553ff2e7762e2c8585a12882f63433e879a29700b89f5dd451fdbb9c2f5be')

build() {
  cd "$srcdir"/pyo-"$pkgver"
  python setup.py build --use-double --use-jack
}

package() {
  cd "$srcdir"/pyo-"$pkgver"
  python setup.py install --use-double --use-jack --root="$pkgdir"/
}
