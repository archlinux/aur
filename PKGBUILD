# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Francois Boulogne <fboulogne at april dot org>

pkgname=videomaker
pkgver=0.2
pkgrel=2
pkgdesc="Build a movie from pictures"
arch=('any')
url="https://github.com/sciunto/VideoMaker"
license=('GPL3')
depends=('python' 'texlive-core' 'texlive-bin' 'mencoder' 'ffmpeg' 'python-pillow')
makedepends=('python-setuptools')
source=(https://source.sciunto.org/videomaker/VideoMaker-${pkgver}.tar.bz2)
md5sums=("1d02ea2a6cc7ca4381df15322ee61843")

build() {
  cd "${srcdir}/"
  python setup.py build
}

package() {
  cd "${srcdir}/"
  python setup.py install --root="${pkgdir}"
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}


# vim:ts=2:sw=2:et:
