# Maintainer:Martin C. Doege <mdoege at compuserve dot com>

pkgname='openastro'
pkgver='1.1.50'
pkgrel=1
pkgdesc='Open source fully-featured astrology software'
arch=('i686' 'x86_64')
license=('GPL')
url='http://www.openastro.org/'
depends=('imagemagick' 'python2-dateutil' 'python2-rsvg' 'python2-pytz' 'pyswisseph')
makedepends=('python2-setuptools')
optdepends=()
conflicts=('openastro-dev' 'swisseph_12' 'swisseph_18' 'swisseph-fixstars')
source=(
	"openastro.org_"$pkgver".orig.tar.gz::http://www.openastro.org/download.php?file=source&type=openastro"
	"openastro.org-data_1.7.orig.tar.gz::http://openastro.org/download.php?file=source&type=data"
	)
md5sums=('e992f70476e4853adef116ab347f902f'
         '418c3f7d1a24f58881e4dabf8c962c9f')

package() {
    cd $srcdir"/openastro.org-"$pkgver
    python2 setup.py install --root=$pkgdir || return 1
    cd $srcdir"/openastro.org-data-1.7"
    python2 setup.py install --root=$pkgdir || return 1
}
