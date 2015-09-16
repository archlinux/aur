# Maintainer: Fabien Dubosson <fabien.dubosson@gmail.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname="percol"
pkgver="0.2.1"
pkgrel="1"
pkgdesc="Adds flavor of interactive filtering to the traditional pipe concept of UNIX shell"
arch=('any')
depends=('python2')
makedepends=('python2-setuptools')
optdepends=('python2-cmigemo')
url="https://github.com/mooz/percol"
license=('MIT')
options=(!emptydirs)
source=(https://github.com/mooz/${pkgname}/archive/v${pkgver}.tar.gz)
sha256sums=('75056ba1fe190ae4c728e68df963c0e7d19bfe5a85649e51ae4193d4011042f9')
conflicts=('percol-git')
changelog="ChangeLog"

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  msg 'Building...'
  python2 setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  msg 'Installing...'
  python2 setup.py install --root="${pkgdir}" --optimize=1
}
