# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Francois Boulogne <fboulogne at april dot org>

pkgname=mat
pkgver=0.5.4
pkgrel=1
pkgdesc="Metadata anonymisation toolkit"
arch=('any')
url="https://mat.boum.org"
license=('GPL2')
depends=('python2-distutils-extra' 'python2' 'hachoir-core' 'hachoir-parser' 'python2-cairo' 'python2-poppler' 'python2-pdfrw' 'python2-gobject' 'python2-pillow')
optdepends=('perl-image-exiftool: extended image support',
'mutagen: extended audio format support')
source=(https://mat.boum.org/files/mat-${pkgver}.tar.xz)
sha256sums=('a928cb2d5ebcafec4563b552096436771598376f8b4dded86a769c278c1314d1')

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:ts=2:sw=2:et:
