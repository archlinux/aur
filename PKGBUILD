# Maintainer: Lev Lybin <lev.lybin@gmail.com>
# Contributor: lagrange <flkazemakase@gmail.com>
# Contributor: mid-kid <esteve.varela@gmail.com>

pkgname=python-kivy
pkgver=1.9.0
pkgrel=1
pkgdesc="A software library for rapid development of hardware-accelerated multitouch applications."
arch=('i686' 'x86_64')
url="http://kivy.org/"
license=('MIT')
depends=('gstreamer' 'sdl2_ttf' 'sdl2_mixer' 'sdl2_image')
makedepends=('python' 'cython-kivy')
source=(https://pypi.python.org/packages/source/K/Kivy/Kivy-${pkgver}.tar.gz)
sha256sums=('b828617f858963f7873f5c81bb8824ca1dfa265e7811fce03599e2ba7200ffa0')

build() {
  cd "${srcdir}/Kivy-${pkgver}"
  python setup.py build build_ext --inplace
}

package() {
  cd "${srcdir}/Kivy-${pkgver}"
  python setup.py install --prefix=/usr --root="${pkgdir}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
