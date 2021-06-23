# Maintainer: Carlo Capocasa <carlo@capocasa.net>
# Maintainer: Peter Sutton <peter@foxdogstudios.com>
# Contributor: amiguet <contact at matthieuamiguet dot ch>
# Based on python2-pyo by amiguet

pkgname=python-pyo
pkgver=1.0.4
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
sha512sums=('efb6eacee9574e6d411a02c33ca6eb93bfafeacbee09c1f229c0265f1bca41b10d52abaafd137b96355af2a16162adda327b23a54a715fd30435a215bde5054b')

build() {
  cd "$srcdir"/pyo-"$pkgver"
  python setup.py build --use-double --use-jack
}

package() {
  cd "$srcdir"/pyo-"$pkgver"
  python setup.py install --use-double --use-jack --root="$pkgdir"/
}
