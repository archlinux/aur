# Maintainer:Martin C. Doege <mdoege at compuserve dot com>

pkgname='openastro'
pkgver='1.1.48'
pkgrel='5'
pkgdesc='Open source fully-featured astrology software'
arch=('i686' 'x86_64')
license=('GPL')
url='http://www.openastro.org/'
depends=('imagemagick' 'python2-dateutil' 'python2-rsvg' 'python2-pytz' 'pyswisseph')
makedepends=('setuptools')
optdepends=()
conflicts=('openastro-dev' 'swisseph_12' 'swisseph_18' 'swisseph-fixstars')
source=(
	"openastro.org_"$pkgver".orig.tar.gz::http://www.openastro.org/download.php?file=source&type=openastro"
	"openastro.org-data_1.6.orig.tar.gz::http://openastro.org/download.php?file=source&type=data"
	)
md5sums=('b64d7263b5ab4e5a61b05cf57a2aea5b'
         'cd6b05177a454a5e6b8458403725130a')

package() {
    cd $srcdir"/openastro.org-"$pkgver
    python2 setup.py install --root=$pkgdir || return 1
    cd $srcdir"/openastro.org-data-1.6"
    python2 setup.py install --root=$pkgdir || return 1
}
