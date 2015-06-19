# Maintainer: Patrick McCarty <pnorcks at gmail dot com>
# Contributor: Mariusz Libera <mariusz.libera@gmail.com>
# Contributor: Chris Tusa <linisys@gmail.com>
# Contributor: Thore Bunde <root [at] netpimp [dot] de>

pkgname=yum-metadata-parser
pkgver=1.1.4
pkgrel=8
pkgdesc="C-based metadata parser to quickly parse xml metadata into sqlite databases."
arch=('i686' 'x86_64')
license=('GPL')
url="http://yum.baseurl.org/download/yum-metadata-parser/"
depends=('python2' 'libxml2'  'glib2')
source=(http://yum.baseurl.org/download/${pkgname}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('f1560a284541feb720c3ae35b6b31f80c2be5cb9ca86b3a1ee9459846f821ada')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}

# vim:set ts=2 sw=2 et:
