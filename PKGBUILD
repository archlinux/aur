# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Francois Boulogne <fboulogne at april dot org>

pkgname=mat2
pkgver=0.8.0
pkgrel=1
pkgdesc="Metadata anonymisation toolkit"
arch=('any')
url="https://0xacab.org/jvoisin/mat2"
license=('GPL3')
makedepends=('python-setuptools')
depends=('python' 'perl' 'perl-image-exiftool' 'python-mutagen' 'python-cairo' 'python-gobject')
optdepends=('ffmpeg' 'bubblewrap')
source=(https://0xacab.org/jvoisin/mat2/-/archive/${pkgver}/mat2-${pkgver}.zip)
sha256sums=('e0e9cd6888176ed75bdcdc8cf5ce402cad6f989166cfd50d5d03a88a399fb719')

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:ts=2:sw=2:et:
