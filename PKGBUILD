# Maintainer: Doron Behar <doron.behar@gmail.com>

pkgname=python-bashlex
_name=bashlex
pkgver=0.12
pkgrel=2
pkgdesc="Python port of the parser used internally by GNU bash"
arch=('i686' 'x86_64')
url="https://github.com/idank/bashlex"
license=('GPL3')
depends=('python')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=(${url}/archive/${pkgver}.tar.gz)
md5sums=('2c049feb6ed621da4389a76ffad07228')

package() {
  cd "$srcdir/$_name-$pkgver"
  # until https://github.com/idank/bashlex/pull/34 is merged
  sed -i 's/enum34/enum34;python_version<"3.4"/' setup.py
  python setup.py install --root="$pkgdir/" --optimize=1
}
