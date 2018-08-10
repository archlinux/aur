# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Francois Boulogne <fboulogne at april dot org>

pkgname=mat
pkgver=0.6.1
pkgrel=2
pkgdesc="Metadata anonymisation toolkit"
arch=('any')
url="https://mat.boum.org"
license=('GPL2')
depends=('python2-distutils-extra' 'hachoir-core' 'hachoir-parser' 'python2' 'python2-cairo' 'python2-poppler' 'python2-pdfrw' 'python2-gobject' 'python2-pillow')
optdepends=('perl-image-exiftool: extended image support',
'mutagen: extended audio format support')
source=(https://mat.boum.org/files/mat-${pkgver}.tar.xz)
sha256sums=('0782e7db554ad1dddefd71c9c81e36a05464d73ab54ee2a474ea6ac90e8e51b9')

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:ts=2:sw=2:et:
