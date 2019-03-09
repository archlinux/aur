# Maintainer:Martin C. Doege <mdoege at compuserve dot com>

pkgname='openastro'
pkgver='1.1.57'
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
	"openastro.org-data_1.9.orig.tar.gz::http://openastro.org/download.php?file=source&type=data"
	)
md5sums=('4bb719ac3a22976d425f6337fd925d32'
         'bf9b6b2ba2ced1a532e16df11447d471')

package() {
    cd $srcdir"/openastro.org-"$pkgver
    python setup.py install --root=$pkgdir || return 1
    cd $srcdir"/openastro.org-data-1.9"
    python setup.py install --root=$pkgdir || return 1
    mkdir -p $pkgdir/usr/share/icons
    cp $srcdir"/openastro.org-"$pkgver/icons/openastro.svg $pkgdir/usr/share/icons
}
