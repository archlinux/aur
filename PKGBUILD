# Maintainer: Élie Bouttier <elie+aur@bouttier.eu>
# Old Maintainer: Malte Bublitz <malte70+aur@mcbx.de>
# Old Maintainer: Tom Vincent <http://tlvince.com/contact/>
# Contributor: Sven Klomp <mail@klomp.eu>

pkgname=python2-gnupg
_pkgsrcname=python-gnupg
pkgver=0.4.0
pkgrel=1
pkgdesc="The gnupg module allows Python programs to make use of the functionality provided by the GNU Privacy Guard."
url="https://bitbucket.org/vinay.sajip/python-gnupg"
license=("BSD")
arch=("any")
depends=('python2' 'gnupg')
source=("https://bitbucket.org/vinay.sajip/${_pkgsrcname}/get/${pkgver}.tar.gz")
md5sums=('322aa9c0d354200695c3ecd7b8a565b1')

build() {
  cd $srcdir/vinay.sajip-${_pkgsrcname}-????????????/
  python2 setup.py build
}

package() {
  cd $srcdir/vinay.sajip-${_pkgsrcname}-????????????/
  python2 setup.py install --prefix=${pkgdir}/usr --optimize=1
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
