# Maintainer: Lev Lybin <lev.lybin@gmail.com>
# Contributor: lagrange <flkazemakase@gmail.com>
# Contributor: mid-kid <esteve.varela@gmail.com>

pkgname=python-kivy
pkgver=1.9.1
pkgrel=1
pkgdesc="A software library for rapid development of hardware-accelerated multitouch applications."
arch=('i686' 'x86_64')
url="http://kivy.org/"
license=('MIT')
depends=('gstreamer' 'sdl2_ttf' 'sdl2_mixer' 'sdl2_image')
makedepends=('python' 'cython-kivy')
source=(https://pypi.python.org/packages/source/K/Kivy/kivy-${pkgver}.tar.gz)
sha256sums=('29bc45be34c26a8acb1dafdd329145f997a473be344cd052659f821f6478637e')

build() {
  cd "${srcdir}/kivy-${pkgver}"
  python setup.py build build_ext --inplace
}

package() {
  cd "${srcdir}/kivy-${pkgver}"
  python setup.py install --prefix=/usr --root="${pkgdir}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
