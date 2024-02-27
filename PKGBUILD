# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Lukas Sabota <LTsmooth42 at gmail dot com>
# Contributor: Patrick McCarty <pnorcks at gmail dot com>
# Contributor: Mariusz Libera <mariusz.libera@gmail.com>
# Contributor: Chris Tusa <linisys@gmail.com>
# Contributor: Thore Bunde <root [at] netpimp [dot] de>

_distname=yum-metadata-parser
pkgname="${_distname}"
pkgver='1.1.4'
pkgrel=11
pkgdesc='C-based metadata parser to quickly parse xml metadata into sqlite databases.'
arch=('i686' 'x86_64')
license=('GPL-2.0-only')
url="http://yum.baseurl.org/download/${_distname}/"
depends=(
  'glib2'
  'libxml2'
  'python2'
  'sqlite3'
)
makedepends=('python2-setuptools')
_tarname="${_distname}-${pkgver}"
source=("${_tarname}.tar.gz::${url}/${_tarname}.tar.gz")
sha256sums=('f1560a284541feb720c3ae35b6b31f80c2be5cb9ca86b3a1ee9459846f821ada')

build(){
  cd "${_tarname}"
  python2 setup.py build
}

package() {
  cd "${_tarname}"
  python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
