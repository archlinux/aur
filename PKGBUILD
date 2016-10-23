# Maintainer: Bastien Traverse <firstname at lastname dot email>

pkgname=brutha
pkgver=1.1.1
pkgrel=1
pkgdesc="Sync FLAC music files to Ogg Vorbis (or keep lossy as-is)"
arch=('any')
url="https://pypi.python.org/pypi/brutha"
license=('GPL')
depends=('mutagen' 'sox')
makedepends=('python2-setuptools')
optdepends=('parallel: for parallel runs'
            'make: for parallel runs'
            'vorbisgain: for --gain')
source=("https://pypi.python.org/packages/28/a0/5e604f8ff19f4bfd0972c963e170f8690629733fa584f16e44cde38b5364/${pkgname}-${pkgver}.tar.gz")
md5sums=('4b25964d8e1b368d6f04facf471fca87')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}"/ --optimize=1

  install -D -m644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
}
