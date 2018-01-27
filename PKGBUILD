# Maintainer:Martin C. Doege <mdoege at compuserve dot com>

pkgname='openastro'
pkgver='1.1.56'
pkgrel=2
pkgdesc='Open source fully-featured astrology software'
arch=('i686' 'x86_64')
license=('GPL')
url='http://www.openastro.org/'
depends=('imagemagick' 'python-dateutil' 'python-cairo' 'python-pytz' 'pyswisseph3' 'python-gobject')
makedepends=('python-setuptools')
optdepends=()
conflicts=('openastro-dev' 'swisseph_12' 'swisseph_18' 'swisseph-fixstars')
source=(
	"openastro.org_"$pkgver".orig.tar.gz::http://www.openastro.org/download.php?file=source&type=openastro"
	"openastro.org-data_1.8.orig.tar.gz::http://openastro.org/download.php?file=source&type=data"
	)
md5sums=('3d9c160e18c3b3bc1635f63d197ae1cc'
         'b799f2ceca718d5ea15e18770dea07d8')

package() {
    cd $srcdir"/openastro.org-"$pkgver
    python setup.py install --root=$pkgdir || return 1
    cd $srcdir"/openastro.org-data-1.8"
    python setup.py install --root=$pkgdir || return 1
}
