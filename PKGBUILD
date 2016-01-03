# Maintainer: Bastien Traverse <firstname at lastname dot email>

pkgname=brutha
pkgver=1.0.2
pkgrel=1
pkgdesc="Sync FLAC music files to Ogg Vorbis (or keep lossy as-is)"
arch=('any')
url="http://git.p.engu.in/laurentb/brutha/"
license=('GPL')
depends=('mutagen' 'sox')
makedepends=('python2-setuptools')
optdepends=('parallel: for parallel runs'
            'make: for parallel runs')
source=("https://pypi.python.org/packages/source/b/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('1ba6959747531984723b2feadecc02c6c54746c1f5facb4f2b9c62e609a668d2')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}"/ --optimize=1

  install -D -m644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
}
