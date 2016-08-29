# Maintainer: Alexander Scharinger <e1028732 at student dot tuwien dot ac dot at>
# Contributor: Tristan Webb <t2webb@ucsd.edu>
# Contributor Sindwiller
pkgname=pyspread
pkgver=1.0.3
pkgrel=1
pkgdesc="A cross-platform Python spreadsheet application. Python 2.7 version"
arch=('any')
url="https://manns.github.io/pyspread/"
license=('GPL3')
depends=('python2>=2.7.0' 'python2-numpy>=1.1.0' 'wxpython' 'python2-matplotlib'
         'cairo>=1.8.8')
options=(!emptydirs)
source=('https://pypi.python.org/packages/f9/01/a3b4be117b4ea69d0d2c96fdfff47de9a4c61ba8295ed4f4a6ca5eb60306/pyspread-1.0.3.tar.gz')
# The pyspread website lists another optional dependency: pyrsvg>=2.32, for
# displaying SVG files in cells. But pyrsvg is included in cairo (from the
# mandatory dependencies).
# See: https://manns.github.io/pyspread/download.html and on this site follow
# link to pyrsvg.
optdepends=('python2-gnupginterface: for opening files without approval' # in AUR
            'python2-xlrd: open Excel files' # in Community
            'python2-xlwt: save Excel files' # in Community
            'python2-jedi: TAB autocompletion and context help in the entry line' # in Community
            'python2-basemap: for the weather example' ) # in Community
# To update the md5sum use the following command.
# $ makepkg -g >> PKGBUILD
md5sums=('b240c8fb57ce7354334982266fae47b5')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 setup.py install --root=$pkgdir/ --optimize=1
  mv $pkgdir/usr/lib/python2.7/site-packages/{changelog,README} \
     $pkgdir/usr/lib/python2.7/site-packages/pyspread/
}

# vim:set ts=2 sw=2 et:
