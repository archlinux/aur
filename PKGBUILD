# Maintainer: Carlo Capocasa <carlo@capocasa.net>
# Maintainer: Peter Sutton <peter@foxdogstudios.com>
# Contributor: amiguet <contact at matthieuamiguet dot ch>
# Based on python2-pyo by amiguet

pkgname=python-pyo
pkgver=1.0.1
pkgrel=2
pkgdesc="Python DSP module"
arch=('x86_64')
url="http://ajaxsoundstudio.com/software/pyo/"
license=('GPL')
depends=('python' 'portmidi' 'portaudio' 'liblo' 'libsndfile')
makedepends=('python-setuptools')
optdepends=('wxpython: wxWidgets GUI')
provides=("pyo=$pkgver" "python-pyo=$pkgver")
conflicts=('pyo')
source=("https://codeload.github.com/belangeo/pyo/tar.gz/$pkgver")
sha512sums=('701e9461bebdfc6a117c65fb4198015389f7e2cfb50f3d53423add307541bd732bf80f416f2bc36f20311eebf1ea8d75e0b0784f6ff206f7b6ab70c3f6081c4a')

build() {
  cd "$srcdir"/pyo-"$pkgver"
  python setup.py build --use-double --use-jack
}

package() {
  cd "$srcdir"/pyo-"$pkgver"
  python setup.py install --use-double --use-jack --root="$pkgdir"/
}
